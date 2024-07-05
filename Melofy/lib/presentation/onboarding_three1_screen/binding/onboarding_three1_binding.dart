import '../controller/onboarding_three1_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OnboardingThree1Screen.
///
/// This class ensures that the OnboardingThree1Controller is created when the
/// OnboardingThree1Screen is first loaded.
class OnboardingThree1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingThree1Controller());
  }
}
