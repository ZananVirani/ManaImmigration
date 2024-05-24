import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/presentation/create_account_phone_number_screen/models/create_account_phone_number_model.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';

/// A controller class for the CreateAccountPhoneNumberScreen.
///
/// This class manages the state of the CreateAccountPhoneNumberScreen, including the
/// current createAccountPhoneNumberModelObj
class CreateAccountPhoneNumberController extends GetxController {

  TextEditingController phoneNumberController = TextEditingController();

  Rx<CreateAccountPhoneNumberModel> createAccountPhoneNumberModelObj =
      CreateAccountPhoneNumberModel().obs;

  Rx<Country> selectedCountry =
      CountryPickerUtils.getCountryByPhoneCode('91').obs;

    String number = '';
    bool errorShow = false;

  @override
  void onClose() {
    super.onClose();
    number;
    phoneNumberController.dispose();
  }
}
