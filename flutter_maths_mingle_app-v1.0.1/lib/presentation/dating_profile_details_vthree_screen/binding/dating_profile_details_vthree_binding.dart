import '../controller/dating_profile_details_vthree_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DatingProfileDetailsVthreeScreen.
///
/// This class ensures that the DatingProfileDetailsVthreeController is created when the
/// DatingProfileDetailsVthreeScreen is first loaded.
class DatingProfileDetailsVthreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DatingProfileDetailsVthreeController());
  }
}
