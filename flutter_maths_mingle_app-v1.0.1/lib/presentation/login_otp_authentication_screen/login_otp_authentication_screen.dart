import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:pinput/pinput.dart';

import 'controller/login_otp_authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class LoginOtpAuthenticationScreen
    extends GetWidget<LoginOtpAuthenticationController> {
  LoginOtpAuthenticationScreen({Key? key}) : super(key: key);
  bool isOtp = false;

  GlobalKey<FormState> loginOtpKey = GlobalKey<FormState>();

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
        appBar:
            PrefData.getAppBar(onTap: () => Get.back(), text: 'Verify Login'),
        body: GetBuilder<LoginOtpAuthenticationController>(
          init: LoginOtpAuthenticationController(),
          builder: (controller) {
            return Form(
              key: loginOtpKey,
              child: Padding(
                padding: EdgeInsets.only(left: 24.h, right: 24.h, top: 16.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 1.h, right: 11.h),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "msg_enter_otp_code_we2".tr,
                                    style: CustomTextStyles.bodyLargeff000000),
                                TextSpan(
                                    text: "lbl_492".tr,
                                    style: CustomTextStyles.bodyLargeffd97bca),
                                TextSpan(
                                    text: "lbl_708_204_6547".tr,
                                    style: CustomTextStyles.bodyLargeffd97bca),
                                TextSpan(
                                    text: "msg_this_code_will_expirad".tr,
                                    style: CustomTextStyles.bodyLargeff000000)
                              ]),
                              textAlign: TextAlign.left)),
                      GetBuilder<LoginOtpAuthenticationController>(
                        builder: (controller) {
                          return Padding(
                            padding: EdgeInsets.only(top: 32.h),
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
                        init: LoginOtpAuthenticationController(),
                      ),
                      CustomElevatedButton(
                          margin: EdgeInsets.only(
                            top: 48.h,
                          ),
                          text: "lbl_verify_code".tr,
                          onPressed: () {
                            if (loginOtpKey.currentState!.validate()) {
                              onTapVerifyCode();
                              pinController.clear();
                              controller.update();
                            }
                          }),
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

  /// Navigates to the homeMakeFriendsContainerScreen when the action is triggered.
  onTapVerifyCode() {
    PrefData.setLogin(false);
    Get.toNamed(AppRoutes.bottomBarScreen);
  }
}
