import 'package:Melofy/presentation/home_search_partners_page/models/home_search_partners_model.dart';

import '../controller/home_search_partners_controller.dart';
import 'package:get/get.dart';

/**
 * Necessary bindings for Get state manegement library in BottomBarScreen
 */
class HomeSearchPartnersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => HomeSearchPartnersController(HomeSearchPartnersModel().obs));
  }
}
