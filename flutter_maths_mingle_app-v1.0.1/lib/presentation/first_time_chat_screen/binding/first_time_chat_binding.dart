import '../controller/first_time_chat_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FirstTimeChatScreen.
///
/// This class ensures that the FirstTimeChatController is created when the
/// FirstTimeChatScreen is first loaded.
class FirstTimeChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirstTimeChatController());
  }
}
