import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/presentation/create_account_otp_code_screen/models/create_account_otp_code_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';

/// A controller class for the CreateAccountOtpCodeScreen.
///
/// This class manages the state of the CreateAccountOtpCodeScreen, including the
/// current createAccountOtpCodeModelObj
class CreateAccountOtpCodeController extends GetxController with CodeAutoFill {
  TextEditingController otpController = TextEditingController();

  Rx<CreateAccountOtpCodeModel> createAccountOtpCodeModelObj =
      CreateAccountOtpCodeModel().obs;


  // Set Hours. (ex. 1 hours)




  bool sendOtp =false;

  @override
  void codeUpdated() {
    otpController.text = code ?? '';
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }
}
