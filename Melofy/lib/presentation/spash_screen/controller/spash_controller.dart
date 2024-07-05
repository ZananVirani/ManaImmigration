import 'dart:async';

import 'package:Melofy/core/app_export.dart';
import 'package:Melofy/presentation/spash_screen/models/spash_model.dart';

import '../../../data/pref_data/pref_data.dart';

/// A controller class for the SpashScreen.
///
/// This class manages the state of the SpashScreen, including the
/// current spashModelObj
class SpashController extends GetxController {
  Rx<SpashModel> spashModelObj = SpashModel().obs;

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () async {
      bool isIntro = await PrefData.getIntro();
      bool isLogin = await PrefData.getLogin();
      var connectivityList = await Connectivity().checkConnectivity();

      if (connectivityList.contains(ConnectivityResult.none)) {
        Get.offAndToNamed(AppRoutes.noConnectionPage);
      } else {
        if (isIntro) {
          Get.offAndToNamed(AppRoutes.onboardingThree1Screen);
        } else if (isLogin) {
          Get.offAndToNamed(AppRoutes.createAccountSelectInterestScreen);
        } else {
          Get.offAndToNamed(AppRoutes.bottomBarScreen);
        }
      }
    });
  }
}
