import '../../../core/app_export.dart';
import 'discoverbyinterest_item_model.dart';

/// This class defines the variables used in the [discover_by_interest_vone_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DiscoverByInterestVoneModel {
  Rx<List<DiscoverbyinterestItemModel>> discoverbyinterestItemList = Rx([
    DiscoverbyinterestItemModel(
      discoverTitle: 'Interested in photography'.obs,
        personImg: [ImageConstant.imgDiscInt1],
        interestedInPhotographyImage: ImageConstant.imgRectangle24976.obs,
        thirteenKText: "+13K".obs),
    DiscoverbyinterestItemModel(
      discoverTitle: 'Readable content of a page'.obs,
        personImg: [ImageConstant.imgDiscInt2],
        interestedInPhotographyImage: ImageConstant.imgRectangle2497660x60.obs,
        thirteenKText: "+16K".obs),
    DiscoverbyinterestItemModel(
        discoverTitle: 'Looking at its layout'.obs,
        personImg: [ImageConstant.imgDiscInt3],
        interestedInPhotographyImage: ImageConstant.imgRectangle249761.obs,
        thirteenKText: "+17K".obs),
    DiscoverbyinterestItemModel(
        discoverTitle: 'Making it look like readable'.obs,
        personImg: [ImageConstant.imgDiscInt4],
        interestedInPhotographyImage: ImageConstant.imgRectangle249762.obs,
        thirteenKText: "+19K".obs),
    DiscoverbyinterestItemModel(
      discoverTitle: 'Interested in photography'.obs,
        personImg: [ImageConstant.imgDiscInt5],
        interestedInPhotographyImage: ImageConstant.imgRectangle249763.obs,
        thirteenKText: "+15K".obs),
    DiscoverbyinterestItemModel(
      discoverTitle: 'Various versions have evolv'.obs,
        personImg: [ImageConstant.imgDiscInt6],
        interestedInPhotographyImage: ImageConstant.imgRectangle249764.obs,
        thirteenKText: "+85K".obs),
    DiscoverbyinterestItemModel(
      discoverTitle: 'Evolved over the years'.obs,
        personImg: [ImageConstant.imgDiscInt7],
        interestedInPhotographyImage: ImageConstant.imgRectangle249765.obs,
        thirteenKText: "+65K".obs)
  ]);
}
