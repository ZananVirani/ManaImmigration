import 'package:flutter/widgets.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/presentation/onboarding_one_screen/models/onboarding_one_model.dart';

/// A controller class for the OnboardingOneScreen.
///
/// This class manages the state of the OnboardingOneScreen, including the
/// current onboardingOneModelObj
class OnboardingOneController extends GetxController {
  Rx<OnboardingOneModel> onboardingOneModelObj = OnboardingOneModel().obs;
  final _pageController = PageController();
  final _currentPage = 0.obs;

  int index = 0;
  changeScreen(int value){
    index = value;
    update();
  }



  Rx<int> sliderIndex = 0.obs;



  PageController get pageController => _pageController;
  int get currentPage => _currentPage.value;

  @override
  void onInit() {
    super.onInit();
    _pageController.addListener(() {
      _currentPage.value = _pageController.page!.round();
    });
  }

  @override
  void onClose() {
    _pageController.dispose();
    super.onClose();
  }
}
