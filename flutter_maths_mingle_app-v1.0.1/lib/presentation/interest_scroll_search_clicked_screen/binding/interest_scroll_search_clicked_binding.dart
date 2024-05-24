import '../controller/interest_scroll_search_clicked_controller.dart';
import 'package:get/get.dart';

/// A binding class for the InterestScrollSearchClickedScreen.
///
/// This class ensures that the InterestScrollSearchClickedController is created when the
/// InterestScrollSearchClickedScreen is first loaded.
class InterestScrollSearchClickedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InterestScrollSearchClickedController());
  }
}
