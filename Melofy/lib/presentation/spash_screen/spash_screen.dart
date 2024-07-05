import 'controller/spash_controller.dart';
import 'package:flutter/material.dart';
import 'package:Melofy/core/app_export.dart';

class SpashScreen extends GetWidget<SpashController> {
  const SpashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(172, 33, 109, 0.498),
        body: Container(
            height: double.infinity,
            width: double.maxFinite,
            child: CustomImageView(
                imagePath: ImageConstant.newLogo,
                width: 150,
                height: 150,
                fit: BoxFit.contain)));
  }

  /// Navigates to the onboardingOneScreen when the action is triggered.
  onTapFrame() {
    // Get.toNamed(
    //   // AppRoutes.onboardingOneScreen,
    // );
  }
}
