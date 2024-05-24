import 'package:flutter_maths_mingle_app/core/app_export.dart';import 'package:flutter_maths_mingle_app/presentation/create_account_name_screen/models/create_account_name_model.dart';import 'package:flutter/material.dart';/// A controller class for the CreateAccountNameScreen.
///
/// This class manages the state of the CreateAccountNameScreen, including the
/// current createAccountNameModelObj
class CreateAccountNameController extends GetxController {TextEditingController nameController = TextEditingController();

Rx<CreateAccountNameModel> createAccountNameModelObj = CreateAccountNameModel().obs;

@override void onClose() { super.onClose(); nameController.dispose(); } 
 }
