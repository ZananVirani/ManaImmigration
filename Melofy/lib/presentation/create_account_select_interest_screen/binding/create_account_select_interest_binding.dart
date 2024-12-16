import '../controller/create_account_select_interest_controller.dart';
import 'package:get/get.dart';

/**
 * Necessary bindings for Get state manegement library in BottomBarScreen
 */
class CreateAccountSelectInterestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAccountSelectInterestController());
  }
}
