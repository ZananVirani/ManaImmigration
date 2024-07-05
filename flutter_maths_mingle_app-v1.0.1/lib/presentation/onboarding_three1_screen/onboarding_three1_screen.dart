// ignore_for_file: unused_import, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter_maths_mingle_app/API/api_calls.dart';
import 'package:flutter_maths_mingle_app/authorization/spotify_auth.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:oauth2_client/access_token_response.dart';

import 'controller/onboarding_three1_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_elevated_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

class OnboardingThree1Screen extends StatefulWidget {
  const OnboardingThree1Screen({super.key});

  @override
  State<OnboardingThree1Screen> createState() => _OnboardingThree1ScreenState();
}

class _OnboardingThree1ScreenState extends State<OnboardingThree1Screen> {
  bool showErrorMessage = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          return Future(() => false);
        },
        child: Scaffold(
            backgroundColor: appTheme.secondaryColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.onBoard,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  // ++ DO NOT TOUCH THIS ++ height: 512,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.v),
                        child: Text('Music for You,\nPicked by You',
                            style: theme.textTheme.headlineMedium,
                            textAlign: TextAlign.center)),
                    // CustomElevatedButton(
                    //     text: 'Login with Phone',
                    //     margin: EdgeInsets.only(
                    //         left: 24.h, right: 24.h, top: 5.h, bottom: 16.h),
                    //     onPressed: () {
                    //       Get.toNamed(AppRoutes.createAccountPhoneNumberScreen);
                    //     },
                    //     buttonStyle: CustomButtonStyles.fillPrimary),
                    CustomElevatedButton(
                      text: 'Login with Spotify   ',
                      margin: EdgeInsets.only(
                          left: 24.h, right: 24.h, bottom: 30.h),
                      onPressed: () async {
                        try {
                          AccessTokenResponse? accessToken =
                              await SpotifyAuthService.getAccessToken();

                          if (!(accessToken is AccessTokenResponse))
                            throw Exception();

                          await PrefData.setAccessToken(accessToken);
                          await PrefData.setRefreshToken(accessToken);
                          await PrefData.setIntro(false);
                          await MakeAPICall.refreshName();
                          await Get.offAndToNamed(
                              AppRoutes.createAccountSelectInterestScreen);
                        } catch (e) {
                          showCupertinoDialog(
                              context: context, builder: createDialog);
                          setState(() {
                            showErrorMessage = true;
                          });
                        }
                      },
                      buttonStyle: CustomButtonStyles.fillPrimary,
                      buttonTextStyle: CustomTextStyles.titleMediumWhiteA70017,
                      height: 90.v,
                      rightIcon: Brand(
                        Brands.spotify,
                      ),
                    ),
                  ],
                )
              ],
            ),
            bottomNavigationBar: _buildLoginFrame(showErrorMessage)),
      ),
    );
  }

  Widget createDialog(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text("Authorization needed to continue"),
      actions: [
        CupertinoDialogAction(
          child: Text("Ok"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }

  Widget _buildLoginFrame(bool showErrorMessage) {
    return Padding(
        padding: EdgeInsets.only(bottom: 24.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.only(bottom: 4.v),
              child: showErrorMessage
                  ? RichText(
                      text: TextSpan(
                          text:
                              "Please Authorize in order \nto access Music4U.",
                          style: CustomTextStyles.titleMediumRed500),
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      "Must have a Spotify Account to access Music4U.",
                      style: CustomTextStyles.titleSmallPrimary,
                    ))
        ]));
  }
}
