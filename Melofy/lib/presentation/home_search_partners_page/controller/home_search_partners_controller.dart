import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:Melofy/core/app_export.dart';
import 'package:Melofy/presentation/home_search_partners_page/models/home_search_partners_model.dart';

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
    super.onInit();
  }
}
