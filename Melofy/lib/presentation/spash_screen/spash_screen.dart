import 'controller/spash_controller.dart';
import 'package:flutter/material.dart';
import 'package:Melofy/core/app_export.dart';

/**
 * Splash screen to show the logo of the app
 */
class SpashScreen extends GetWidget<SpashController> {
  const SpashScreen({Key? key}) : super(key: key);

  /**
   * Build method to create the UI of the page, with the logo of the app
   */
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
}
