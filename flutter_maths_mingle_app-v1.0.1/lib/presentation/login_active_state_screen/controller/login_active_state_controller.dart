import 'package:flutter_maths_mingle_app/core/app_export.dart';import 'package:flutter_maths_mingle_app/presentation/login_active_state_screen/models/login_active_state_model.dart';import 'package:country_pickers/country.dart';import 'package:country_pickers/utils/utils.dart';import 'package:flutter/material.dart';/// A controller class for the LoginActiveStateScreen.
///
/// This class manages the state of the LoginActiveStateScreen, including the
/// current loginActiveStateModelObj
class LoginActiveStateController extends GetxController {TextEditingController phoneNumberController = TextEditingController();

Rx<LoginActiveStateModel> loginActiveStateModelObj = LoginActiveStateModel().obs;

Rx<Country> selectedCountry = CountryPickerUtils.getCountryByPhoneCode('49').obs;

@override void onClose() { super.onClose(); phoneNumberController.dispose(); } 
 }
