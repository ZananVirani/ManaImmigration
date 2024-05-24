import '../controller/my_account_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MyAccountScreen.
///
/// This class ensures that the MyAccountController is created when the
/// MyAccountScreen is first loaded.
class MyAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAccountController());
  }
}
