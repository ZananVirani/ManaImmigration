import '../../../core/app_export.dart';

/// This class is used in the [discoverbyinterest_item_widget] screen.

class DiscoverbyinterestItemModel {
  DiscoverbyinterestItemModel({
    this.interestedInPhotographyImage,
    this.thirteenKText,
    this.id,
    this.personImg,
    this.discoverTitle
  }) {
    interestedInPhotographyImage =
        interestedInPhotographyImage ?? Rx(ImageConstant.imgRectangle24976);
    thirteenKText = thirteenKText ?? Rx("+13K");
    id = id ?? Rx("");
    personImg = personImg ?? [ ImageConstant.imgRectangle24976];
    discoverTitle = discoverTitle ?? Rx("Interested in photography");
  }

  Rx<String>? interestedInPhotographyImage;

  Rx<String>? thirteenKText;

  Rx<String>? id;
  List<String>? personImg;
  Rx<String>? discoverTitle;
}
