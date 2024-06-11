// ignore_for_file: unused_import, deprecated_member_use

import 'package:flutter_maths_mingle_app/authorization/spotify_auth.dart';
import 'package:oauth2_client/access_token_response.dart';

import 'controller/onboarding_three1_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_elevated_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

class OnboardingThree1Screen extends GetWidget<OnboardingThree1Controller> {
  const OnboardingThree1Screen({Key? key}) : super(key: key);

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
                      text: 'Login with Spotify',
                      margin: EdgeInsets.only(
                          left: 24.h, right: 24.h, bottom: 64.h),
                      onPressed: () {
                        // if (onController.index == onController.index - 1) {
                        // } else if (onController.index == 1) {
                        //  PrefData.setIntro(false);
                        //  Get.toNamed(
                        //   AppRoutes.onboardingThree1Screen,
                        //  );
                        // } else {
                        //  onController.pageController.nextPage(
                        //      duration: const Duration(milliseconds: 100),
                        //      curve: Curves.bounceIn);
                        // }
                        var accessToken = SpotifyAuthService.getAccessToken();
                      },
                      buttonStyle: CustomButtonStyles.fillPrimary,
                      buttonTextStyle: CustomTextStyles.titleMediumWhiteA70017,
                      height: 90.v,
                    ),
                  ],
                )
              ],
            ),
            bottomNavigationBar: _buildLoginFrame()),
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginFrame() {
    return Padding(
        padding: EdgeInsets.only(bottom: 32.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.only(bottom: 4.v),
              child: Text("Must have a Spotify Account to access Music4U.",
                  style: CustomTextStyles.titleSmallPrimary)),
          // Padding(
          //     padding: EdgeInsets.only(left: 4.h),
          //     child: GestureDetector(
          //       onTap: () {
          //         onTapLoginWithPhone();
          //       },
          //       child: Text("lbl_sign_up".tr,
          //           style: CustomTextStyles.titleSmallPrimary),
          //     ))
        ]));
  }

  /// Navigates to the createAccountPhoneNumberScreen when the action is triggered.
  onTapLoginWithPhone() {
    Get.toNamed(
      AppRoutes.createAccountPhoneNumberScreen,
    );
  }

  /// Navigates to the loginEmptyStateScreen when the action is triggered.
  onTapLoginWithGoogle() {
    Get.toNamed(
      AppRoutes.loginEmptyStateScreen,
    );
  }
}
