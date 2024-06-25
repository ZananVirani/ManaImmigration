import 'package:flutter_maths_mingle_app/core/app_export.dart';
//import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:flutter_maths_mingle_app/presentation/profile_page/models/profile_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ProfilePage.
///
/// This class manages the state of the ProfilePage, including the
/// current profileModelObj
class ProfileController extends GetxController {
  ProfileController(this.profileModelObj);

  TextEditingController languageController = TextEditingController();

  TextEditingController settingsController = TextEditingController();

  Rx<ProfileModel> profileModelObj;

  String profilePic = '';

  String subProfilePic = '';

  isMathed() async {
    // profilePic = await PrefData.getProfilePicPath();
    // update();
    // subProfilePic = await PrefData.getSubProfile();
    // update();
  }

  @override
  void onClose() {
    super.onClose();
    isMathed();
    languageController.dispose();
    settingsController.dispose();
  }
}
