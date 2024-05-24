import '../controller/dating_profile_details_vtwo_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DatingProfileDetailsVtwoScreen.
///
/// This class ensures that the DatingProfileDetailsVtwoController is created when the
/// DatingProfileDetailsVtwoScreen is first loaded.
class DatingProfileDetailsVtwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DatingProfileDetailsVtwoController());
  }
}
