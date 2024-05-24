// ignore_for_file: deprecated_member_use

import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';

import 'controller/create_account_name_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/core/utils/validation_functions.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_elevated_button.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class CreateAccountNameScreen extends GetWidget<CreateAccountNameController> {
  CreateAccountNameScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> nameKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future(() => false),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PrefData.getAppBar(
              onTap: () {

              }, text: 'msg_what_s_your_name'.tr),
          body: Form(
              key: nameKey,
              child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 24.h),
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 16.v),
                        height: 8.v,
                        width: 327.h,
                        decoration: BoxDecoration(
                            color: appTheme.gray10002,
                            borderRadius: BorderRadius.circular(4.h)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(4.h),
                            child: LinearProgressIndicator(
                                value: 0.2,
                                backgroundColor: appTheme.gray10002,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    theme.colorScheme.primary)))),
                    SizedBox(height: 11.v),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "lbl_1".tr,
                              style: CustomTextStyles.bodyLargeff696969),
                          TextSpan(
                              text: "lbl_5".tr,
                              style: CustomTextStyles.titleLargeffd97bca)
                        ]),
                        textAlign: TextAlign.left),

                    SizedBox(height: 32.h),
                    CustomTextFormField(
                        controller: controller.nameController,
                        hintText: "lbl_enter_your_name".tr,
                        hintStyle: CustomTextStyles.bodyLargeGray700,
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (!isText(value) || value!.isEmpty) {
                            return "Please enter valid name".tr;
                          }
                          return null;
                        }),
                    SizedBox(height: 48.h),
                    CustomElevatedButton(
                        text: "lbl_continue".tr,
                        onPressed: () {
                          if (nameKey.currentState!.validate()) {
                            onTapContinue();
                            controller.nameController.text= '';
                            controller.update();
                          }
                        }),
                    SizedBox(height: 5.v)
                  ]))),
    );
  }



  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the createAccountBirthdateScreen when the action is triggered.
  onTapContinue() {
    Get.toNamed(
      AppRoutes.createAccountBirthdateScreen,
    );
  }
}
