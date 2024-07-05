

import '../../../core/app_export.dart';
import '../controller/bottombar_screen_controller.dart';

class BottomBarScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomBarScreenController());
  }
}

