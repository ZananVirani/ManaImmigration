import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/presentation/login_otp_authentication_screen/models/login_otp_authentication_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';

/// A controller class for the LoginOtpAuthenticationScreen.
///
/// This class manages the state of the LoginOtpAuthenticationScreen, including the
/// current loginOtpAuthenticationModelObj
class LoginOtpAuthenticationController extends GetxController
    with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;


  Rx<LoginOtpAuthenticationModel> loginOtpAuthenticationModelObj =
      LoginOtpAuthenticationModel().obs;

  @override
  void codeUpdated() {
    otpController.value.text = code ?? '';
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }
}
