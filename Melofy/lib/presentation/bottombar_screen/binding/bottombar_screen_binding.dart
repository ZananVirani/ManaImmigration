import '../../../core/app_export.dart';
import '../controller/bottombar_screen_controller.dart';

/**
 * Necessary bindings for Get state manegement library in BottomBarScreen
 */
class BottomBarScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomBarScreenController());
  }
}
