import '../../../core/app_export.dart';
import 'userprofile2_item_model.dart';
import 'column_item_model.dart';

/// This class defines the variables used in the [discover_page],
/// and is typically used to hold data that is passed between different parts of the application.
class DiscoverModel {
  Rx<List<Userprofile2ItemModel>> userprofile2ItemList = Rx([
    Userprofile2ItemModel(
        userImage: ImageConstant.imgRectangle24968.obs,
        userName: "Kenneth".obs,
        userText: "Bgeyj".obs),
    Userprofile2ItemModel(
        userImage: ImageConstant.imgRectangle24968126x98.obs,
        userName: "Locke".obs,
        userText: "Marguerite".obs),
    Userprofile2ItemModel(
        userImage: ImageConstant.imgRectangle249681.obs,
        userName: "Kenneth".obs,
        userText: "McAlister".obs),
    Userprofile2ItemModel(
        userImage: ImageConstant.imgRectangle249682.obs,
        userName: "Kenneth".obs,
        userText: "Bgeyj".obs)
  ]);

  Rx<List<ColumnItemModel>> columnItemList = Rx([
    ColumnItemModel(
        dynamicProperty1: ImageConstant.intFootball.obs,
        dynamicProperty2: "Football".obs),
    ColumnItemModel(
        dynamicProperty1: ImageConstant.intNature.obs,
        dynamicProperty2: "Nature".obs),
    ColumnItemModel(
        dynamicProperty1: ImageConstant.intWritting.obs,
        dynamicProperty2: "Writing".obs),
    ColumnItemModel(
        dynamicProperty1: ImageConstant.intMusic.obs,
        dynamicProperty2: "Music".obs),
    ColumnItemModel(
        dynamicProperty1: ImageConstant.intLanguages.obs,
        dynamicProperty2: "Launguage".obs),
    ColumnItemModel(
        dynamicProperty1: ImageConstant.intPhotography.obs,
        dynamicProperty2: "Photograp..".obs),
    ColumnItemModel(
        dynamicProperty1: ImageConstant.intFashion.obs,
        dynamicProperty2: "Fashion..".obs),
  ]);
}
