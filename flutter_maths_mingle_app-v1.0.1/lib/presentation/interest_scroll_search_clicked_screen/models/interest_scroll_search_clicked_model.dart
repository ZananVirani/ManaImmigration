import '../../../core/app_export.dart';
import 'interestscroll_item_model.dart';

/// This class defines the variables used in the [interest_scroll_search_clicked_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class InterestScrollSearchClickedModel {
  Rx<List<InterestscrollItemModel>> interestscrollItemList = Rx([
    InterestscrollItemModel(
        footballImage: ImageConstant.intFootball.obs,
        footballText: "Football".obs),
    InterestscrollItemModel(
        footballImage: ImageConstant.intNature.obs, footballText: "Nature".obs),
    InterestscrollItemModel(
        footballImage: ImageConstant.intWritting.obs, footballText: "Writing".obs),
    InterestscrollItemModel(
        footballImage: ImageConstant.intMusic.obs,
        footballText: "Music".obs),
    InterestscrollItemModel(
        footballImage: ImageConstant.intLanguages.obs,
        footballText: "Launguage".obs),
    InterestscrollItemModel(
        footballImage: ImageConstant.intPhotography.obs,
        footballText: "Photograp..".obs),
    InterestscrollItemModel(
        footballImage: ImageConstant.intFashion.obs, footballText: "Fashion".obs)
  ]);
}
