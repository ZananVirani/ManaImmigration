import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/presentation/home_search_partners_swipe_left_page/models/home_search_partners_swipe_left_model.dart';

/// A controller class for the HomeSearchPartnersSwipeLeftPage.
///
/// This class manages the state of the HomeSearchPartnersSwipeLeftPage, including the
/// current homeSearchPartnersSwipeLeftModelObj
class HomeSearchPartnersSwipeLeftController extends GetxController {
  HomeSearchPartnersSwipeLeftController(
      this.homeSearchPartnersSwipeLeftModelObj);

  Rx<HomeSearchPartnersSwipeLeftModel> homeSearchPartnersSwipeLeftModelObj;
}
