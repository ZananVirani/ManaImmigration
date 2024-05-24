// ignore_for_file: must_be_immutable

import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';

import 'controller/logout_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_elevated_button.dart';

class LogoutDialog extends StatelessWidget {
  LogoutDialog(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  LogoutController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.h,
      padding: EdgeInsets.all(24.h),
      decoration: AppDecoration.white.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            "lbl_logout".tr,
            style: theme.textTheme.headlineSmall,
          ),
          SizedBox(height: 16.h),
          Text(
            "msg_are_you_sure_you".tr,
            style: theme.textTheme.bodyMedium,
          ),
          SizedBox(height: 32.h),
          CustomElevatedButton(
            onPressed: () {
              PrefData.setLogin(true);
              Get.toNamed(AppRoutes.onboardingThree1Screen);
            },
            text: "lbl_yes_logout".tr,
            buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
          ),
        ],
      ),
    );
  }
}
