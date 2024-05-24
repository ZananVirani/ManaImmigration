import 'controller/spash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

class SpashScreen extends GetWidget<SpashController> {
  const SpashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Container(
          height: double.infinity,
            width: double.maxFinite,
            child: CustomImageView(
              imagePath: ImageConstant.splashImg,
            ))
    );
  }

  /// Navigates to the onboardingOneScreen when the action is triggered.
  onTapFrame() {
    // Get.toNamed(
    //   // AppRoutes.onboardingOneScreen,
    // );
  }
}
