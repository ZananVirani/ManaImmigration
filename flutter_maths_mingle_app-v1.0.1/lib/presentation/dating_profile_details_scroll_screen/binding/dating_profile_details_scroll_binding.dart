import '../controller/dating_profile_details_scroll_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DatingProfileDetailsScrollScreen.
///
/// This class ensures that the DatingProfileDetailsScrollController is created when the
/// DatingProfileDetailsScrollScreen is first loaded.
class DatingProfileDetailsScrollBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DatingProfileDetailsScrollController());
  }
}
