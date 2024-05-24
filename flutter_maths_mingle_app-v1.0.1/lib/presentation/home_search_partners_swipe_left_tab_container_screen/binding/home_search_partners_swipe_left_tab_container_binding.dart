import '../controller/home_search_partners_swipe_left_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the HomeSearchPartnersSwipeLeftTabContainerScreen.
///
/// This class ensures that the HomeSearchPartnersSwipeLeftTabContainerController is created when the
/// HomeSearchPartnersSwipeLeftTabContainerScreen is first loaded.
class HomeSearchPartnersSwipeLeftTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeSearchPartnersSwipeLeftTabContainerController());
  }
}
