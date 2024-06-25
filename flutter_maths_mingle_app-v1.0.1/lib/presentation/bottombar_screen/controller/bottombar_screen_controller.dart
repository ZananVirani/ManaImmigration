import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/pref_data/pref_data.dart';

/// A controller class for the HomeScreenContainerScreen.
///
/// This class manages the state of the HomeScreenContainerScreen, including the
/// current homeScreenContainerModelObj
class BottomBarScreenController extends GetxController {
  setIndex(int indexs) {
    PrefData.currentIndex = indexs;
    update();
  }

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
