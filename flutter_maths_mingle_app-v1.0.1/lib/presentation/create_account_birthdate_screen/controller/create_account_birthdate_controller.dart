import 'package:flutter_maths_mingle_app/core/app_export.dart';import 'package:flutter_maths_mingle_app/presentation/create_account_birthdate_screen/models/create_account_birthdate_model.dart';import 'package:flutter/material.dart';/// A controller class for the CreateAccountBirthdateScreen.
///
/// This class manages the state of the CreateAccountBirthdateScreen, including the
/// current createAccountBirthdateModelObj
class CreateAccountBirthdateController extends GetxController {TextEditingController dateController = TextEditingController();

Rx<CreateAccountBirthdateModel> createAccountBirthdateModelObj = CreateAccountBirthdateModel().obs;

@override void onClose() { super.onClose(); dateController.dispose(); } 
 }
