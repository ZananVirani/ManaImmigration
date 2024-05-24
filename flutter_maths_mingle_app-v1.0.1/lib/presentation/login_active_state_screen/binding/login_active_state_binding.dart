import '../controller/login_active_state_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LoginActiveStateScreen.
///
/// This class ensures that the LoginActiveStateController is created when the
/// LoginActiveStateScreen is first loaded.
class LoginActiveStateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginActiveStateController());
  }
}
