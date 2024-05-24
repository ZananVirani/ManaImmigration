import '../../../core/app_export.dart';

/// This class is used in the [userprofile3_item_widget] screen.

class Userprofile3ItemModel {
  Userprofile3ItemModel({
    this.distance,
    this.distanceLabel,
    this.username,
    this.description,
    this.id,
  }) {
    distance = distance ?? Rx(ImageConstant.imgRectangle24979);
    distanceLabel = distanceLabel ?? Rx("13 KM away");
    username = username ?? Rx("Selena Bartlett");
    description = description ?? Rx("Typesetting");
    id = id ?? Rx("1");
  }

  Rx<String>? distance;

  Rx<String>? distanceLabel;

  Rx<String>? username;

  Rx<String>? description;

  Rx<String>? id;
}
