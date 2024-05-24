import '../../../core/app_export.dart';
import 'userprofile3_item_model.dart';

/// This class defines the variables used in the [matches_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class MatchesModel {
  Rx<List<Userprofile3ItemModel>> userprofile3ItemList = Rx([
    Userprofile3ItemModel(
      id: "1".obs,
        distance: ImageConstant.imgRectangle24979.obs,
        distanceLabel: "13 KM away".obs,
        username: "Selena Bartlett".obs,
        description: "Typesetting".obs),
    Userprofile3ItemModel(
        id: "2".obs,
        distance: ImageConstant.imgRectangle24979158x154.obs,
        distanceLabel: "25 KM away".obs,
        username: "Eva Vance".obs,
        description: "Savannah".obs),
    Userprofile3ItemModel(
        id: "3".obs,
        distance: ImageConstant.imgRectangle249791.obs,
        distanceLabel: "120 KM away".obs,
        username: "Cooper Ford".obs,
        description: "Dryer".obs),
    Userprofile3ItemModel(
        id: "4".obs,
        distance: ImageConstant.imgRectangle249792.obs,
        distanceLabel: "12 KM away".obs,
        username: "Dominic Grimsh".obs,
        description: "William".obs),
    Userprofile3ItemModel(
        id: "5".obs,
        distance: ImageConstant.imgRectangle249793.obs,
        distanceLabel: "13 KM away".obs,
        username: "Angelina Sheean".obs,
        description: "Typesetting".obs),
    Userprofile3ItemModel(
        id: "6".obs,
        distance: ImageConstant.imgRectangle249794.obs,
        distanceLabel: "13 KM away".obs,
        username: "Taj Spears".obs,
        description: "Typesetting".obs)
  ]);
}
