import '../controller/make_friends_profile_details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MakeFriendsProfileDetailsScreen.
///
/// This class ensures that the MakeFriendsProfileDetailsController is created when the
/// MakeFriendsProfileDetailsScreen is first loaded.
class MakeFriendsProfileDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MakeFriendsProfileDetailsController());
  }
}
