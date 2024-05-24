import '../../../core/app_export.dart';

/// This class is used in the [userprofile_item_widget] screen.

class UserprofileItemModel {
  UserprofileItemModel({
    this.unknownPrinterImage,
    this.unknownPrinterText,
    this.kennethBrandtText,
    this.knushnaText,
    this.id,
  }) {
    unknownPrinterImage =
        unknownPrinterImage ?? Rx(ImageConstant.userPicToMatch2);
    unknownPrinterText = unknownPrinterText ??
        Rx("when an unknown printer took a galley of type and scrambled");
    kennethBrandtText = kennethBrandtText ?? Rx("Kenneth Brandt");
    knushnaText = knushnaText ?? Rx("Knushna");
    id = id ?? Rx("");
  }

  Rx<String>? unknownPrinterImage;

  Rx<String>? unknownPrinterText;

  Rx<String>? kennethBrandtText;

  Rx<String>? knushnaText;

  Rx<String>? id;
}
