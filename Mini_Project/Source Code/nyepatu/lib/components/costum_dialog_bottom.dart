import 'package:flutter/material.dart';
import 'package:nyepatu/components/primary_button.dart';
import 'package:nyepatu/components/secondary_button.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '../provider/preference_provider.dart';
import '../themes/theme.dart';
import '../themes/transitions.dart';
import '../views/sign_screens/sign_in_screens/sign_in_screens.dart';

class CostumDialogBottom extends StatelessWidget {
  const CostumDialogBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultMargin),
      height: 280,
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteOneColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 36.0),
              Text(
                'Alert',
                style: blackTextStyle.copyWith(
                  fontSize: 24.0,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 2.0,
              ),
              Text(
                'Do you want to\nlog out of the application',
                style: secondaryTextStyle.copyWith(
                  fontSize: 16.0,
                  fontWeight: regular,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: purpleFourColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Consumer<AuthProvider>(builder: (context, state, _) {
                    return PrimaryButton(
                      press: () async {
                        if (await state.logout(state.user.token!)) {
                          Provider.of<PreferencesProvider>(context,
                                  listen: false)
                              .deleteUser();
                          Navigator.pushAndRemoveUntil(
                              context,
                              FadeInRoute(
                                routeName: SignIn.routeName,
                                page: const SignIn(),
                              ),
                              (route) => false);
                        }
                      },
                      text: 'Yes',
                    );
                  }),
                ),
                Expanded(
                  child: SecondaryButton(
                    press: () {
                      Navigator.pop(context);
                    },
                    text: 'Cencel',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
