import '../controller/login_otp_authentication_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LoginOtpAuthenticationScreen.
///
/// This class ensures that the LoginOtpAuthenticationController is created when the
/// LoginOtpAuthenticationScreen is first loaded.
class LoginOtpAuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginOtpAuthenticationController());
  }
}
