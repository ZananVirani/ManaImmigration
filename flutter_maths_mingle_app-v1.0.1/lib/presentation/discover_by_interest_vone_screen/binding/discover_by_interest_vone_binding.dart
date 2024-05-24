import '../controller/discover_by_interest_vone_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DiscoverByInterestVoneScreen.
///
/// This class ensures that the DiscoverByInterestVoneController is created when the
/// DiscoverByInterestVoneScreen is first loaded.
class DiscoverByInterestVoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiscoverByInterestVoneController());
  }
}
