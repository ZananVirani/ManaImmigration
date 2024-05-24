import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/presentation/edit_profile_screen/models/edit_profile_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the EditProfileScreen.
///
/// This class manages the state of the EditProfileScreen, including the
/// current editProfileModelObj
class EditProfileController extends GetxController {

  TextEditingController nameEditTextController = TextEditingController();

  TextEditingController dateOfBirthEditTextController = TextEditingController();

  TextEditingController descriptionEditTextController = TextEditingController();

  TextEditingController countryEditTextController = TextEditingController();

  TextEditingController genderEditTextController = TextEditingController();

  Rx<EditProfileModel> editProfileModelObj = EditProfileModel().obs;


  @override
  void onClose() {
    super.onClose();
    nameEditTextController.dispose();
    dateOfBirthEditTextController.dispose();
    descriptionEditTextController.dispose();
    countryEditTextController.dispose();
    genderEditTextController.dispose();
  }
}
