import '../controller/dating_profile_details_vone_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DatingProfileDetailsVoneScreen.
///
/// This class ensures that the DatingProfileDetailsVoneController is created when the
/// DatingProfileDetailsVoneScreen is first loaded.
class DatingProfileDetailsVoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DatingProfileDetailsVoneController());
  }
}
