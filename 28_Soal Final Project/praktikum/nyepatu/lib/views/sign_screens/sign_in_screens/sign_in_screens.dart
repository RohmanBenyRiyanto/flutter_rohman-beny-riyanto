import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/button_icon_circle.dart';
import '../../../components/loading_button.dart';
import '../../../components/primary_button.dart';
import '../../../components/text_from_field.dart';
import '../../../components/text_from_field_pw.dart';
import '../../../components/text_hyperlink.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/preference_provider.dart';
import '../../../themes/theme.dart';
import '../../../themes/transitions.dart';
import '../../mainpage_screens/main_page.dart';
import '../sign_up_screens/sign_up_screens.dart';

class SignIn extends StatefulWidget {
  static const routeName = "/sign_in";
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formGlobalKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;

  AppBar header() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: whiteOneColor,
      titleSpacing: 0,
      elevation: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonIconCircle(
              icons: 'assets/icons/ic_back.svg',
              press: () {
                Navigator.of(context).pop();
              },
            ),
            Text(
              "Let's Sign In",
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 40.0,
              width: 40.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget content() {
    return Form(
      // autovalidateMode: AutovalidateMode.always,
      key: formGlobalKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: defaultMargin,
              ),
              Text(
                "Welcome\nBack!",
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              CostumTextFromField(
                controllers: emailController,
                keyboardTypes: TextInputType.emailAddress,
                hintTexts: "Input your email",
                validators: (value) {
                  if (value!.isEmpty) {
                    return ("Please Input Your Email!");
                  }
                  // reg expression for email validation
                  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                    return ("Please Enter a valid email");
                  }
                  return null;
                },
                onChangeds: (value) {
                  emailController.text = value!;
                },
              ),
              SizedBox(
                height: defaultMargin,
              ),
              CostumTextFromFieldPW(
                controllers: passwordController,
                // keyboardTypes: TextInputType.visiblePassword,
                hintTexts: "Input your Password",
                validators: (value) {
                  RegExp regex = RegExp(r'^.{6,}$');
                  if (value!.isEmpty) {
                    return ("Password is required for SignIn");
                  }
                  if (!regex.hasMatch(value)) {
                    return ("Enter Valid Password(Min. 6 Character)");
                  }
                  return null;
                },
                onChangeds: (value) {
                  passwordController.text = value!;
                },
              ),
              const SizedBox(
                height: 12.0,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButtons(
                    text: "Forgot Password?",
                    press: () {
                    },
                  )),
              const SizedBox(
                height: 32.0,
              ),
              _button(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _button() {
    _signInHandle() async {
      final login = Provider.of<AuthProvider>(context, listen: false);

      if (formGlobalKey.currentState!.validate()) {
        if (await login.login(
          emailController.text.trim(),
          passwordController.text.trim(),
        )) {
          Provider.of<PreferencesProvider>(context, listen: false)
              .setUser(login.user);
          Navigator.pushAndRemoveUntil(
              context,
              FadeInRoute(
                routeName: MainPage.routeName,
                page: const MainPage(),
              ),
              (route) => false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: greenColor,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  8.0,
                ),
              ),
              content: Text(
                'Sign In Success',
                style: whiteTextStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: medium,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: redColor,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  8.0,
                ),
              ),
              content: Text(
                'Username or Password is incorrect',
                style: whiteTextStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: medium,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      }
    }

    return Consumer<AuthProvider>(
      builder: (context, state, _) {
        if (state.state == AuthState.loading) {
          return const LoadingButton();
        }
        return PrimaryButton(
            text: "Sign In",
            press: () {
              _signInHandle();
            });
      },
    );
  }

  Widget footer() {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: defaultMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don\'t have an account? ',
            style: subtitleTextStyle.copyWith(
              fontSize: 14.0,
            ),
          ),
          TextButtons(
            text: "Sign Up",
            press: () {
              Navigator.push(
                context,
                FadeInRoute(
                  routeName: '/sign-up',
                  page: const SignUp(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteOneColor,
      appBar: header(),
      body: content(),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
