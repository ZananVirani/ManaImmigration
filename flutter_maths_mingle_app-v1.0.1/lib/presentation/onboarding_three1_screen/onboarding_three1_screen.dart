// ignore_for_file: unused_import, deprecated_member_use

import 'controller/onboarding_three1_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_elevated_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

class OnboardingThree1Screen extends GetWidget<OnboardingThree1Controller> {
  const OnboardingThree1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
                      padding: EdgeInsets.symmetric(vertical: 20.v),
                      child: Text('Music for You, \n Picked by You',
                          style: theme.textTheme.headlineMedium,
                          textAlign: TextAlign.end)),
                  CustomElevatedButton(
                      text: 'Login with Phone',
                      margin: EdgeInsets.only(
                          left: 24.h, right: 24.h, top: 5.h, bottom: 16.h),
                      onPressed: () {
                        Get.toNamed(AppRoutes.createAccountPhoneNumberScreen);
                      },
                      buttonStyle: CustomButtonStyles.fillPrimary),
                  CustomElevatedButton(
                    text: 'Login with Google',
                    margin:
                        EdgeInsets.only(left: 24.h, right: 24.h, bottom: 64.h),
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
                      Get.toNamed(AppRoutes.loginEmptyStateScreen);
                    },
                    buttonStyle: CustomButtonStyles.fillWhiteA,
                    buttonTextStyle: CustomTextStyles.titleMediumGray700,
                  ),
                ],
              )
            ],
          ),
          bottomNavigationBar: _buildLoginFrame()),
    );
  }

  /// Section Widget
  Widget _buildLoginFrame() {
    return Padding(
        padding: EdgeInsets.only(bottom: 32.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.only(bottom: 1.v),
              child: Text("msg_don_t_have_an_account".tr,
                  style: theme.textTheme.bodyMedium)),
          Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: GestureDetector(
                onTap: () {
                  onTapLoginWithPhone();
                },
                child: Text("lbl_sign_up".tr,
                    style: CustomTextStyles.titleSmallPrimary),
              ))
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
