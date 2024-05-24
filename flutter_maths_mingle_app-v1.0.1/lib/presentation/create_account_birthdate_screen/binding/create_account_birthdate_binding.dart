import '../controller/create_account_birthdate_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CreateAccountBirthdateScreen.
///
/// This class ensures that the CreateAccountBirthdateController is created when the
/// CreateAccountBirthdateScreen is first loaded.
class CreateAccountBirthdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAccountBirthdateController());
  }
}
