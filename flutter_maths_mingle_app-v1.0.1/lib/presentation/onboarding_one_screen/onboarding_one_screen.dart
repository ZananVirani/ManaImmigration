import 'package:dots_indicator/dots_indicator.dart';

import '../../data/list_data/app_listdata.dart';
import '../../data/pref_data/pref_data.dart';
import 'controller/onboarding_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_elevated_button.dart';

class OnboardingOneScreen extends GetWidget<OnboardingOneController> {
  const OnboardingOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingOneController>(
      builder: (onController) {
        // ignore: deprecated_member_use
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Scaffold(
            backgroundColor: Color(0xFFFDEEFA),
            body: SafeArea(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    controller: onController.pageController,
                    physics: BouncingScrollPhysics(),
                    itemCount: AppListData.onboardingList.length,
                    onPageChanged: (value) {
                      onController.changeScreen(value);
                      onController.update();
                    },
                    itemBuilder: (context, index) {
                      return CustomImageView(
                        imagePath: AppListData.onboardingList[index].img,
                        width: double.infinity,
                        fit: BoxFit.fill,
                        // height: 512.adaptSize,
                      );
                    },
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.h),
                        child: Text(
                          AppListData
                                  .onboardingList[onController.index].title ??
                              'MatchMingle to the rescue',
                          style: theme.textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.h, right: 24.h, top: 8.h, bottom: 40.h),
                        child: Text(
                          AppListData
                                  .onboardingList[onController.index].details ??
                              'Your love life, our expertis finding love is a journey let us guide you',
                          style: theme.textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      DotsIndicator(
                        dotsCount: AppListData.onboardingList.length,
                        position: onController.index,
                        decorator: DotsDecorator(
                          size: Size.square(
                            8.h,
                          ),
                          activeSize: Size(24.h, 8.h),
                          spacing: EdgeInsets.only(right: 6.h),
                          activeColor: theme.colorScheme.primary,
                          color: Color(0xFFD9D9D9),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                      CustomElevatedButton(
                          text: 'Next',
                          margin: EdgeInsets.only(
                              left: 24.h, right: 24.h, top: 40.h, bottom: 16.h),
                          onPressed: () {
                            if (onController.index == onController.index - 1) {
                            } else if (onController.index == 1) {
                              PrefData.setIntro(false);
                              Get.toNamed(
                                AppRoutes.onboardingThree1Screen,
                              );
                            } else {
                              onController.pageController.nextPage(
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.bounceIn);
                            }
                          },
                          buttonStyle: CustomButtonStyles.fillPrimary),
                      Padding(
                        padding: EdgeInsets.only(bottom: 32.h),
                        child: GestureDetector(
                          onTap: () {
                            PrefData.setIntro(false);
                            Get.toNamed(
                              AppRoutes.onboardingThree1Screen,
                            );
                          },
                            child: Text(
                          'Skip',
                          style: theme.textTheme.bodyMedium,
                        )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      init: OnboardingOneController(),
    );
  }

  /// Navigates to the onboardingThreeScreen when the action is triggered.
  onTapNext() {
    Get.toNamed(
      AppRoutes.onboardingThreeScreen,
    );
  }

  /// Navigates to the onboardingThree1Screen when the action is triggered.
  onTapTxtSkip() {
    Get.toNamed(
      AppRoutes.onboardingThree1Screen,
    );
  }
}
