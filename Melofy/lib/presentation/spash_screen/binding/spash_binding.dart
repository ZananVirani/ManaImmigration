import '../controller/spash_controller.dart';
import 'package:get/get.dart';

/**
 * Necessary bindings for Get state manegement library in BottomBarScreen
 */
class SpashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SpashController());
  }
}
