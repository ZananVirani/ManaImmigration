import '../controller/make_friends_profile_details_scroll_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MakeFriendsProfileDetailsScrollScreen.
///
/// This class ensures that the MakeFriendsProfileDetailsScrollController is created when the
/// MakeFriendsProfileDetailsScrollScreen is first loaded.
class MakeFriendsProfileDetailsScrollBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MakeFriendsProfileDetailsScrollController());
  }
}
