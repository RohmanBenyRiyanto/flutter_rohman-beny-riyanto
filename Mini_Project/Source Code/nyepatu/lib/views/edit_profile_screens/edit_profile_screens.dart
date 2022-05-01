import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nyepatu/views/profile_screens/profile_screens.dart';
import 'package:provider/provider.dart';

import '../../components/button_icon_circle.dart';
import '../../components/costum_alertdialog.dart';
import '../../components/text_from_field.dart';
import '../../provider/auth_provider.dart';
import '../../themes/theme.dart';
import '../../themes/transitions.dart';

class EditProfile extends StatefulWidget {
  static const routeName = '/edit-profile';
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final formGlobalKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isEmailValid = false;

  @override
  void initState() {
    super.initState();
    final user = Provider.of<AuthProvider>(context, listen: false).user;
    fullNameController = TextEditingController(text: user.name);
    userNameController = TextEditingController(text: user.username);
    emailController = TextEditingController(text: user.email);
  }

  @override
  Widget build(BuildContext context) {
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
                press: () {
                  Navigator.pop(context);
                },
                icons: 'assets/icons/ic_back.svg',
              ),
              Text(
                'Edit Profile',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              Consumer<AuthProvider>(
                builder: (context, state, _) => ButtonIconCircle(
                  press: () async {
                    if (formGlobalKey.currentState!.validate()) {
                      if (await state.editProfile(
                        state.user.token!,
                        fullNameController.text,
                        userNameController.text,
                        emailController.text,
                      )) {
                        showSuccessDialog();
                      }
                    }
                  },
                  icons: 'assets/icons/ic_tick.svg',
                  color: purpleOneColor,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Consumer<AuthProvider>(
        builder: (context, state, _) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Form(
              key: formGlobalKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: defaultMargin,
                    ),
                    Container(
                      height: 90.0,
                      width: 90.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            state.user.profilePhoto!,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Full Name',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CostumTextFromField(
                          controllers: fullNameController,
                          keyboardTypes: TextInputType.text,
                          hintTexts: state.user.name,
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
                      ],
                    ),
                    SizedBox(
                      height: defaultMargin,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User Name',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CostumTextFromField(
                          controllers: userNameController,
                          keyboardTypes: TextInputType.text,
                          hintTexts: state.user.username,
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
                      ],
                    ),
                    SizedBox(
                      height: defaultMargin,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CostumTextFromField(
                          controllers: emailController,
                          keyboardTypes: TextInputType.emailAddress,
                          hintTexts: state.user.email,
                          validators: (value) {
                            if (value!.isEmpty) {
                              return ("Please Input Your Email!");
                            }
                            // reg expression for email validation
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please Enter a valid email");
                            }
                            return null;
                          },
                          onChangeds: (value) {
                            emailController.text = value!;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: header(),
      backgroundColor: whiteOneColor,
      body: content(),
    );
  }

  @override
  void dispose() {
    fullNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  Future<void> showSuccessDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => SizedBox(
        width: displayWidth(context) - defaultMargin,
        child: CostumAlertDialog(
          press: () {
            Navigator.pop(context, true);
          },
          icons: 'assets/icons/ic_succes.svg',
          tittle: 'Success',
          subtitle: 'Your profile has been updated',
          buttontext: 'View My Profile',
        ),
      ),
    );
  }
}
