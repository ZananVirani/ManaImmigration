import 'controller/spash_controller.dart';
import 'package:flutter/material.dart';
import 'package:Melofy/core/app_export.dart';

class SpashScreen extends GetWidget<SpashController> {
  const SpashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: CustomImageView(
          imagePath: ImageConstant.newLogo,
        ),
      ),
    );
  }

  /// Navigates to the onboardingOneScreen when the action is triggered.
  onTapFrame() {
    // Get.offAndToNamed(
    //   // AppRoutes.onboardingOneScreen,
    // );
  }
}
