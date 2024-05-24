import '../../../core/app_export.dart';

/// This class is used in the [interestscroll_item_widget] screen.

class InterestscrollItemModel {
  InterestscrollItemModel({
    this.footballImage,
    this.footballText,
    this.id,
  }) {
    footballImage = footballImage ?? Rx(ImageConstant.intFootball);
    footballText = footballText ?? Rx("Football");
    id = id ?? Rx("");
  }

  Rx<String>? footballImage;

  Rx<String>? footballText;

  Rx<String>? id;
}
