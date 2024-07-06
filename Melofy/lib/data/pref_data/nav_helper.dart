// navigation_helper.dart
import 'package:Melofy/core/app_export.dart';

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