import 'package:flutter_maths_mingle_app/presentation/home_search_partners_page/controller/home_search_partners_controller.dart';
import 'package:flutter_maths_mingle_app/presentation/home_search_partners_page/models/home_search_partners_model.dart';

import 'package:get/get.dart';

/// A binding class for the HomeMakeFriendsContainerScreen.
///
/// This class ensures that the HomeMakeFriendsContainerController is created when the
/// HomeMakeFriendsContainerScreen is first loaded.
class HomeMakeFriendsContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => HomeSearchPartnersController(HomeSearchPartnersModel().obs));
  }
}
