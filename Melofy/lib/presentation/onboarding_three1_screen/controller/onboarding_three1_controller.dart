import 'package:Melofy/core/app_export.dart';
import 'package:Melofy/presentation/onboarding_three1_screen/models/onboarding_three1_model.dart';

/// A controller class for the OnboardingThree1Screen.
///
/// This class manages the state of the OnboardingThree1Screen, including the
/// current onboardingThree1ModelObj
class OnboardingThree1Controller extends GetxController {
  Rx<OnboardingThree1Model> onboardingThree1ModelObj =
      OnboardingThree1Model().obs;
}
