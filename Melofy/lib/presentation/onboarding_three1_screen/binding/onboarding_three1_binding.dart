import '../controller/onboarding_three1_controller.dart';
import 'package:get/get.dart';

/**
 * Necessary bindings for Get state manegement library in BottomBarScreen
 */
class OnboardingThree1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingThree1Controller());
  }
}
