import '../controller/create_account_name_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CreateAccountNameScreen.
///
/// This class ensures that the CreateAccountNameController is created when the
/// CreateAccountNameScreen is first loaded.
class CreateAccountNameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAccountNameController());
  }
}
