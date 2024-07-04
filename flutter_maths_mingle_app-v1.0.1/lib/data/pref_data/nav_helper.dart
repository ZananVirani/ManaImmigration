// navigation_helper.dart
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/routes/app_routes.dart';
import 'package:get/get_core/src/get_main.dart';

class NavigationHelper {
  static Future<void> navigateToOnboardingThree() async {
    await Get.toNamed(AppRoutes.onboardingThree1Screen);
  }
}

// PrefData.dart
class PrefData {
  static Future<void> logout() async {
    print("logging out");
    // Clear user data or perform logout actions
    await NavigationHelper.navigateToOnboardingThree();
  }
}