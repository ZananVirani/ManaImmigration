import '../../../core/app_export.dart';
import 'column2_item_model.dart';
import 'gendertext_item_model.dart';

/// This class defines the variables used in the [make_friends_profile_details_scroll_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class MakeFriendsProfileDetailsScrollModel {
  Rx<List<Column2ItemModel>> column2ItemList = Rx([
    Column2ItemModel(
        dynamicProperty1: ImageConstant.intFootball.obs,
        dynamicProperty2: "Football".obs),
    Column2ItemModel(
        dynamicProperty1: ImageConstant.intNature.obs,
        dynamicProperty2: "Nature".obs),
    Column2ItemModel(
        dynamicProperty1: ImageConstant.intWritting.obs,
        dynamicProperty2: "Writing".obs),
    Column2ItemModel(
        dynamicProperty1: ImageConstant.intMusic.obs,
        dynamicProperty2: "Music".obs)
  ]);

  Rx<List<GendertextItemModel>> gendertextItemList = Rx([
    GendertextItemModel(
        genderImage: ImageConstant.genderIc.obs,
        genderText: "Gender".obs,
        maleText: "Male".obs),
    GendertextItemModel(
        genderImage: ImageConstant.ageIc.obs,
        genderText: "Age".obs,
        maleText: "21 Year".obs),
    GendertextItemModel(
        genderImage: ImageConstant.friendIc.obs,
        genderText: "Friends".obs,
        maleText: "1212".obs)
  ]);
}
