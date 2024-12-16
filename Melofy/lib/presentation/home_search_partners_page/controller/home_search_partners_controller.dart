import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:Melofy/core/app_export.dart';
import 'package:Melofy/presentation/home_search_partners_page/models/home_search_partners_model.dart';

/**
 * A controller class for the Home Screen, using getx for state management.
 */
class HomeSearchPartnersController extends GetxController {
  HomeSearchPartnersController(this.homeSearchPartnersModelObj);

  Rx<HomeSearchPartnersModel> homeSearchPartnersModelObj;

  final CardSwiperController swiperController = CardSwiperController();

  @override
  void onInit() {
    super.onInit();
  }
}
