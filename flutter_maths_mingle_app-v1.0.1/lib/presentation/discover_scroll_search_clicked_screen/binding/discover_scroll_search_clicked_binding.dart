import '../controller/discover_scroll_search_clicked_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DiscoverScrollSearchClickedScreen.
///
/// This class ensures that the DiscoverScrollSearchClickedController is created when the
/// DiscoverScrollSearchClickedScreen is first loaded.
class DiscoverScrollSearchClickedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiscoverScrollSearchClickedController());
  }
}
