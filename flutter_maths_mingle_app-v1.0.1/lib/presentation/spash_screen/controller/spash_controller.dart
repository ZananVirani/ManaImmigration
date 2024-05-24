import 'dart:async';

import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/presentation/spash_screen/models/spash_model.dart';

import '../../../data/pref_data/pref_data.dart';

/// A controller class for the SpashScreen.
///
/// This class manages the state of the SpashScreen, including the
/// current spashModelObj
class SpashController extends GetxController {
  Rx<SpashModel> spashModelObj = SpashModel().obs;

  @override void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () async {
      bool isIntro = await PrefData.getIntro();
      bool isLogin = await PrefData.getLogin();
      // bool isInfo = await PrefData.getInfo();

      if (isIntro) {
        Get.toNamed(AppRoutes.onboardingOneScreen
          ,);
      }
      else {
        if (isLogin) {
          Get.toNamed(AppRoutes.onboardingThree1Screen,);
        }
        else {
          Get.toNamed(AppRoutes.bottomBarScreen,);
        }
      }}
    );
  }
}
