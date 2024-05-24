import '../controller/connect_make_friends_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ConnectMakeFriendsScreen.
///
/// This class ensures that the ConnectMakeFriendsController is created when the
/// ConnectMakeFriendsScreen is first loaded.
class ConnectMakeFriendsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConnectMakeFriendsController());
  }
}
