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
import '../sign_in_screens/sign_in_screens.dart';

class SignUp extends StatefulWidget {
  static const routeName = "/sign_up";
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formGlobalKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AppBar header() {
    return AppBar(
      backgroundColor: whiteOneColor,
      automaticallyImplyLeading: false,
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
                Navigator.pop(context);
              },
            ),
            Text(
              "Let's Sign Up",
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
                "Create\nAccount!",
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              CostumTextFromField(
                controllers: fullNameController,
                keyboardTypes: TextInputType.text,
                hintTexts: "Input your full name",
                validators: (value) {
                  RegExp regex = RegExp(
                      r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");

                  if (value!.isEmpty) {
                    return ("Please Input Your Name");
                  }
                  if (!regex.hasMatch(value)) {
                    return ("Enter Valid Full Name");
                  }

                  return null;
                },
                onChangeds: (value) {
                  fullNameController.text = value!;
                },
              ),
              SizedBox(
                height: defaultMargin,
              ),
              CostumTextFromField(
                controllers: userNameController,
                keyboardTypes: TextInputType.text,
                hintTexts: "Input your user name",
                validators: (value) {
                  RegExp regex = RegExp(r'^.{3,}$');
                  if (value!.isEmpty) {
                    return ("Please Input Your User Name");
                  }
                  if (!regex.hasMatch(value)) {
                    return ("Enter Valid name(Min. 3 Character)");
                  }
                  return null;
                },
                onChangeds: (value) {
                  userNameController.text = value!;
                },
              ),
              SizedBox(
                height: defaultMargin,
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
                    return ("Password is required for SignUp");
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
                      print("Forgot Password");
                    },
                  )),
              const SizedBox(
                height: 32.0,
              ),
              button(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget footer() {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: defaultMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have an account? ',
            style: subtitleTextStyle.copyWith(
              fontSize: 14.0,
            ),
          ),
          TextButtons(
            text: "Sign In",
            press: () {
              Navigator.push(
                context,
                FadeInRoute(
                  routeName: '/sign-in',
                  page: const SignIn(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget button() {
    signUpHandle() async {
      final signup = Provider.of<AuthProvider>(context, listen: false);
      if (formGlobalKey.currentState!.validate()) {
        if (await signup.register(
          fullNameController.text.trim(),
          userNameController.text.trim(),
          emailController.text.trim(),
          passwordController.text.trim(),
        )) {
          Provider.of<PreferencesProvider>(context, listen: false)
              .setUser(signup.user);
          Navigator.pushAndRemoveUntil(
              context,
              FadeInRoute(
                routeName: MainPage.routeName,
                page: const MainPage(),
              ),
              (route) => false);
        } else if (signup.state == AuthState.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: redColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              content: Text(
                'Account already exist!',
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
          text: "Register",
          press: signUpHandle,
        );
      },
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
    fullNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
