import '../controller/spash_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SpashScreen.
///
/// This class ensures that the SpashController is created when the
/// SpashScreen is first loaded.
class SpashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SpashController());
  }
}
