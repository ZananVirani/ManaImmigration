import 'dart:async';

import 'package:Melofy/core/app_export.dart';
import 'package:Melofy/presentation/spash_screen/models/spash_model.dart';

import '../../../data/pref_data/pref_data.dart';

/**
 * A controller class for the BottomBarScreen, using getx for state management.
 */
class SpashController extends GetxController {
  Rx<SpashModel> spashModelObj = SpashModel().obs;

  /**
   * Directs the user to either the onboarding screen, the login screen, 
   * or the home screen based on the user's previous actions.
   */
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
