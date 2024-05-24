import '../controller/create_account_gender_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CreateAccountGenderScreen.
///
/// This class ensures that the CreateAccountGenderController is created when the
/// CreateAccountGenderScreen is first loaded.
class CreateAccountGenderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAccountGenderController());
  }
}
