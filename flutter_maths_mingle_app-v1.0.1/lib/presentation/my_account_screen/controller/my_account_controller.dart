import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/presentation/my_account_screen/models/my_account_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the MyAccountScreen.
///
/// This class manages the state of the MyAccountScreen, including the
/// current myAccountModelObj
class MyAccountController extends GetxController {

  TextEditingController fullNameController = TextEditingController();

  TextEditingController nameEditTextController = TextEditingController();

  TextEditingController dateOfBirthEditTextController = TextEditingController();

  TextEditingController descriptionEditTextController = TextEditingController();

  TextEditingController countryEditTextController = TextEditingController();

  TextEditingController genderEditTextController = TextEditingController();

  Rx<MyAccountModel> myAccountModelObj = MyAccountModel().obs;

  @override
  void onClose() {
    super.onClose();
    fullNameController.dispose();
    dateOfBirthEditTextController.dispose();
    descriptionEditTextController.dispose();
    countryEditTextController.dispose();
    genderEditTextController.dispose();
  }
}
