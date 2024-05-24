import '../../../core/app_export.dart';

/// This class is used in the [languagelist_item_widget] screen.

class LanguagelistItemModel {
  LanguagelistItemModel({
    this.englishImage,
    this.englishText,
    this.checkmarkImage,
    this.id,
  }) {
    englishImage = englishImage ?? Rx(ImageConstant.fEnglish);
    englishText = englishText ?? Rx("English");
    checkmarkImage = checkmarkImage ?? Rx(ImageConstant.UnselectFlgIc);
    id = id ?? Rx("");
  }

  Rx<String>? englishImage;

  Rx<String>? englishText;

  Rx<String>? checkmarkImage;

  Rx<String>? id;
}
