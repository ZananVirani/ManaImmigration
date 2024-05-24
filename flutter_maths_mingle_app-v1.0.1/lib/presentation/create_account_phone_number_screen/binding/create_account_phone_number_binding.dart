import '../controller/create_account_phone_number_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CreateAccountPhoneNumberScreen.
///
/// This class ensures that the CreateAccountPhoneNumberController is created when the
/// CreateAccountPhoneNumberScreen is first loaded.
class CreateAccountPhoneNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAccountPhoneNumberController());
  }
}
