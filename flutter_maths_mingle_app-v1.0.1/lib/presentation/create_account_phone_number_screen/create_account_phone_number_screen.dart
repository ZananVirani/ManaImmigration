// ignore_for_file: unused_import, must_be_immutable, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:pinput/pinput.dart';
import '../../intl_phone_field.dart';
import 'controller/create_account_phone_number_controller.dart';
import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_elevated_button.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_phone_number.dart';

class CreateAccountPhoneNumberScreen
    extends GetWidget<CreateAccountPhoneNumberController> {
  CreateAccountPhoneNumberScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> numberKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PrefData.getAppBar(
            onTap: () => Get.back(), text: "Enter your number".tr),
        body: Form(
            key: numberKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: GetBuilder<CreateAccountPhoneNumberController>(
              init: CreateAccountPhoneNumberController(),
              builder: (controller) {
                return Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.h, vertical: 48.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Obx(() => CustomPhoneNumber(
                          //     country: controller.selectedCountry.value,
                          //     controller: controller.phoneNumberController,
                          //     onTap: (Country value) {
                          //       controller.selectedCountry.value = value;
                          //     }),),
                          // IntlPhoneField(
                          //   decoration: InputDecoration(
                          //     filled: true,
                          //     fillColor: AppColor.lightGray,
                          //     counterText: '',
                          //     contentPadding: EdgeInsets.symmetric(
                          //         horizontal: 16.h, vertical: 16.h),
                          //     errorBorder: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(8.h),
                          //         borderSide: BorderSide(
                          //           color: Colors.transparent,
                          //         )),
                          //     focusedBorder: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(8.h),
                          //         borderSide: BorderSide(
                          //           color: Colors.transparent,
                          //         )),
                          //     disabledBorder: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(8.h),
                          //         borderSide: BorderSide(
                          //           color: Colors.transparent,
                          //         )),
                          //     focusedErrorBorder: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(8.h),
                          //         borderSide:
                          //             BorderSide(color: Colors.transparent)),
                          //     enabledBorder: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(8.h),
                          //         borderSide:
                          //             BorderSide(color: Colors.transparent)),
                          //     border: OutlineInputBorder(
                          //       borderSide:
                          //           BorderSide(color: Colors.transparent),
                          //     ),
                          //   ),
                          //   initialCountryCode: 'IN',
                          //   textController: controller.phoneNumberController,
                          //   autovalidateMode:
                          //       AutovalidateMode.onUserInteraction,
                          //   onChanged: (phone) {
                          //     // print("-------${phone.completeNumber}");
                          //     phone.completeNumber.length;
                          //
                          //     if (phone.isValidNumber()) {
                          //       controller.number = phone.completeNumber;
                          //       controller.update();
                          //       print('valid num-----${phone.completeNumber}');
                          //     } else {
                          //       controller.update();
                          //     }
                          //     // print('done-----${phone.isValidNumber()}');
                          //   },
                          //   validator: (value) {
                          //     if (value!.isValidNumber()) {
                          //     } else {
                          //       controller.update();
                          //     }
                          //     return null;
                          //   },
                          // ),

                          controller.errorShow
                              ? showError(controller)
                              : SizedBox(),
                          SizedBox(height: 48.h),
                          CustomElevatedButton(
                              text: "lbl_continue".tr,
                              onPressed: () {
                                if (controller.number.length >= 10 &&
                                    controller.number.isNotEmpty) {
                                  onTapContinue();
                                  controller.errorShow = false;
                                  controller.phoneNumberController.text = '';
                                  controller.number = '';
                                  controller.update();
                                } else {
                                  controller.errorShow = true;
                                  controller.update();
                                }
                              }),
                          SizedBox(height: 5.v)
                        ]));
              },
            )));
  }

  Widget showError(CreateAccountPhoneNumberController controller) =>
      controller.number.length >= 10
          ? SizedBox()
          : Text(
              'Please enter valid number ',
              style: CustomTextStyles.labelLargeError,
            );

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the createAccountOtpCodeScreen when the action is triggered.
  onTapContinue() {
    Get.toNamed(
      AppRoutes.createAccountOtpCodeScreen,
    );
  }
}
