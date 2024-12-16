import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/pref_data/pref_data.dart';

/**
 * A controller class for the BottomBarScreen, using getx for state management.
 */
class BottomBarScreenController extends GetxController {
  /**
   * Sets the current index of the bottom bar.
   */
  setIndex(int indexs) {
    PrefData.currentIndex = indexs;
    update();
  }

  /**
   * Function to exit the app.
   */
  onExit() {
    if (PrefData.currentIndex != 0) {
      PrefData.currentIndex = 0;
      update();
    } else {
      if (Platform.isIOS) {
        exit(0);
      } else {
        SystemNavigator.pop();
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
