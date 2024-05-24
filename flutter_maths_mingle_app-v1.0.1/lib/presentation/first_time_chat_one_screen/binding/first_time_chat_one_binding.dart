import '../controller/first_time_chat_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FirstTimeChatOneScreen.
///
/// This class ensures that the FirstTimeChatOneController is created when the
/// FirstTimeChatOneScreen is first loaded.
class FirstTimeChatOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirstTimeChatOneController());
  }
}
