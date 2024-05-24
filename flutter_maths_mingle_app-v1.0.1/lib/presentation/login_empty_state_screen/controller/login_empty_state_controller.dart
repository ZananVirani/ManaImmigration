import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/presentation/login_empty_state_screen/models/login_empty_state_model.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';

/// A controller class for the LoginEmptyStateScreen.
///
/// This class manages the state of the LoginEmptyStateScreen, including the
/// current loginEmptyStateModelObj
class LoginEmptyStateController extends GetxController {


  TextEditingController phoneNumberController = TextEditingController();

  Rx<LoginEmptyStateModel> loginEmptyStateModelObj = LoginEmptyStateModel().obs;

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
