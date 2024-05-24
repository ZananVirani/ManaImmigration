import '../controller/create_account_select_interest_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CreateAccountSelectInterestScreen.
///
/// This class ensures that the CreateAccountSelectInterestController is created when the
/// CreateAccountSelectInterestScreen is first loaded.
class CreateAccountSelectInterestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAccountSelectInterestController());
  }
}
