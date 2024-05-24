import '../controller/create_account_otp_code_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CreateAccountOtpCodeScreen.
///
/// This class ensures that the CreateAccountOtpCodeController is created when the
/// CreateAccountOtpCodeScreen is first loaded.
class CreateAccountOtpCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAccountOtpCodeController());
  }
}
