import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/presentation/home_search_partners_page/models/home_search_partners_model.dart';

/// A controller class for the HomeSearchPartnersPage.
///
/// This class manages the state of the HomeSearchPartnersPage, including the
/// current homeSearchPartnersModelObj
class HomeSearchPartnersController extends GetxController {
  HomeSearchPartnersController(this.homeSearchPartnersModelObj);

  Rx<HomeSearchPartnersModel> homeSearchPartnersModelObj;
  // // final CardSwiperController swiperController = CardSwiperController();
  // // final CardSwiperController controller = CardSwiperController();
  // //
  final CardSwiperController swiperController = CardSwiperController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
