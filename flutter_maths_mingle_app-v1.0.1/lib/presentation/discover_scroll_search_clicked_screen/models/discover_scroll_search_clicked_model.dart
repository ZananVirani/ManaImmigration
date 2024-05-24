import '../../../core/app_export.dart';
import 'column1_item_model.dart';

/// This class defines the variables used in the [discover_scroll_search_clicked_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DiscoverScrollSearchClickedModel {
  Rx<List<Column1ItemModel>> column1ItemList = Rx([
    Column1ItemModel(
        dynamicProperty1: ImageConstant.intFootball.obs,
        dynamicProperty2: "Football".obs),
    Column1ItemModel(
        dynamicProperty1: ImageConstant.intNature.obs,
        dynamicProperty2: "Nature".obs),
    Column1ItemModel(
        dynamicProperty1: ImageConstant.intWritting.obs,
        dynamicProperty2: "Writing".obs),
    Column1ItemModel(
        dynamicProperty1: ImageConstant.intMusic.obs,
        dynamicProperty2: "Music".obs)
  ]);
}
