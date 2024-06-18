// ignore_for_file: must_be_immutable

import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_count_down.dart';

import 'controller/create_account_otp_code_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_elevated_button.dart';

class CreateAccountOtpCodeScreen
    extends GetWidget<CreateAccountOtpCodeController> {
  CreateAccountOtpCodeScreen({Key? key}) : super(key: key);

  bool isOtp = false;
  GlobalKey<FormState> otpKey = GlobalKey<FormState>();
  AnimationController? animationController;

  final defaultPinTheme = PinTheme(
    width: 67.h,
    height: 66.v,
    textStyle: CustomTextStyles.headlineSmallff000000,
    decoration: BoxDecoration(
      color: AppColor.lightGray,
      // border: Border.all(
      //  color:AppColor.black40,
      //  width: 1.h,
      // ),
      borderRadius: BorderRadius.circular(12.h),
    ),
  );
  final errorPinTheme = PinTheme(
    width: 67.h,
    height: 66.v,
    textStyle: TextStyle(
      fontSize: 24.h,
      color: Colors.red,
      fontWeight: FontWeight.w400,
    ),
    decoration: BoxDecoration(
      color: AppColor.black10,
      border: Border.all(
        color: Colors.red,
        width: 1.h,
      ),
      borderRadius: BorderRadius.circular(12.h),
    ),
  );
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PrefData.getAppBar(
            onTap: () => Get.back(), text: 'Enter 4 Digits code'.tr),
        body: GetBuilder<CreateAccountOtpCodeController>(
          init: CreateAccountOtpCodeController(),
          builder: (controller) {
            return SafeArea(
              child: Form(
                key: otpKey,
                child: Column(children: [
                  GetBuilder<CreateAccountOtpCodeController>(
                    builder: (controller) {
                      return Padding(
                        padding:
                            EdgeInsets.only(left: 14.h, right: 14.h, top: 40.h),
                        // padding:  getPadding(left: 14,right: 14,top: 40),

                        child: Pinput(
                          length: 4,
                          controller: pinController,
                          keyboardType: TextInputType.number,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          errorPinTheme: errorPinTheme,
                          errorTextStyle: TextStyle(color: Colors.red),
                          defaultPinTheme: defaultPinTheme,

                          // validator: (s) {
                          //   return !s.isBlank! ? null : 'Please enter a valid code';
                          // },
                          validator: (value) {
                            if (value!.length <= 3 || value.isEmpty) {
                              return "Please enter valid otp".tr;
                            }
                            return null;
                          },
                          pinputAutovalidateMode:
                              PinputAutovalidateMode.onSubmit,
                          showCursor: true,
                          onCompleted: (pin) {},
                        ),
                      );
                    },
                    init: CreateAccountOtpCodeController(),
                  ),
                  SizedBox(height: 48.h),
                  CustomElevatedButton(
                      margin: EdgeInsets.symmetric(horizontal: 24.h),
                      text: "lbl_continue".tr,
                      onPressed: () {
                        if (otpKey.currentState!.validate()) {
                          onTapContinue();
                          controller.sendOtp = false;
                          pinController.clear();
                          controller.update();
                        }
                      }),
                  SizedBox(height: 48.h),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("msg_didn_t_received".tr,
                                style: theme.textTheme.bodyMedium),
                            controller.sendOtp
                                ? Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Countdown(
                                      seconds: 30,
                                      build:
                                          (BuildContext context, double time) =>
                                              Text(time.toString(),
                                                  style: CustomTextStyles
                                                      .titleSmallPrimary),
                                      interval: Duration(milliseconds: 100),
                                      onFinished: () {
                                        print('Timer is done!');
                                        controller.sendOtp = false;
                                        controller.update();
                                      },
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: GestureDetector(
                                      onTap: () {
                                        pinController.clear();
                                        controller.sendOtp = true;
                                        controller.update();
                                      },
                                      child: Text("lbl_resend_code".tr,
                                          style: CustomTextStyles
                                              .titleSmallPrimary),
                                    )),
                          ])),
                  SizedBox(height: 5.v)
                ]),
              ),
            );
          },
        ));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the createAccountNameScreen when the action is triggered.
  onTapContinue() {
    Get.toNamed(
      AppRoutes.createAccountNameScreen,
    );
  }
}
