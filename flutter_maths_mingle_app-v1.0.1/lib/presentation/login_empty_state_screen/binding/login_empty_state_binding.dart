import '../controller/login_empty_state_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LoginEmptyStateScreen.
///
/// This class ensures that the LoginEmptyStateController is created when the
/// LoginEmptyStateScreen is first loaded.
class LoginEmptyStateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginEmptyStateController());
  }
}
