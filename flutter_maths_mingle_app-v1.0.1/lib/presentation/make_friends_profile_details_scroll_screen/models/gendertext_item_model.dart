import '../../../core/app_export.dart';

/// This class is used in the [gendertext_item_widget] screen.

class GendertextItemModel {
  GendertextItemModel({
    this.genderImage,
    this.genderText,
    this.maleText,
    this.id,
  }) {
    genderImage = genderImage ?? Rx(ImageConstant.genderIc);
    genderText = genderText ?? Rx("Gender");
    maleText = maleText ?? Rx("Male");
    id = id ?? Rx("");
  }

  Rx<String>? genderImage;

  Rx<String>? genderText;

  Rx<String>? maleText;

  Rx<String>? id;
}
