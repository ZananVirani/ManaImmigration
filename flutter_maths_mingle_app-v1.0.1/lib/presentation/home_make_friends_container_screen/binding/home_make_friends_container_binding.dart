import '../controller/home_make_friends_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the HomeMakeFriendsContainerScreen.
///
/// This class ensures that the HomeMakeFriendsContainerController is created when the
/// HomeMakeFriendsContainerScreen is first loaded.
class HomeMakeFriendsContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeMakeFriendsContainerController());
  }
}
