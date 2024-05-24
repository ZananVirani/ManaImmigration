import 'package:flutter_maths_mingle_app/core/app_export.dart';

/// A controller class for the CreateAccountGenderScreen.
///
/// This class manages the state of the CreateAccountGenderScreen, including the
/// current createAccountGenderModelObj
class CreateAccountGenderController extends GetxController {
  // Rx<CreateAccountGenderModel> createAccountGenderModelObj =
  //     CreateAccountGenderModel(gender: 'male').obs;


  RxInt i = 0.obs;
  RxInt sizeIndex = 0.obs;
  RxInt boxIndex = 0.obs;
  RxBool productPressed = false.obs;
  bool isPressed = false;

  bool isShowResult = false;
  bool isClickable = true;

  bool isAnsTrue = false;
}
