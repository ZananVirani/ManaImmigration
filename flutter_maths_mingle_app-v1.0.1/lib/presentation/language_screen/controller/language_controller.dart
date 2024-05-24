import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/presentation/language_screen/models/language_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the LanguageScreen.
///
/// This class manages the state of the LanguageScreen, including the
/// current languageModelObj
class LanguageController extends GetxController {

  TextEditingController searchController = TextEditingController();
  RxInt i = 0.obs;
  RxInt sizeIndex = 0.obs;
  RxInt boxIndex = 0.obs;
  RxBool productPressed = false.obs;
  bool isPressed = false;


  Rx<LanguageModel> languageModelObj = LanguageModel().obs;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
