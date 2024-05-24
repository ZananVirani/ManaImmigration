import '../controller/discover_filter_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DiscoverFilterScreen.
///
/// This class ensures that the DiscoverFilterController is created when the
/// DiscoverFilterScreen is first loaded.
class DiscoverFilterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiscoverFilterController());
  }
}
