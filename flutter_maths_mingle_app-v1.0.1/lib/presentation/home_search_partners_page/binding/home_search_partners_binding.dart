import 'package:Melofy/presentation/home_search_partners_page/models/home_search_partners_model.dart';

import '../controller/home_search_partners_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SpashScreen.
///
/// This class ensures that the SpashController is created when the
/// SpashScreen is first loaded.
class HomeSearchPartnersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => HomeSearchPartnersController(HomeSearchPartnersModel().obs));
  }
}
