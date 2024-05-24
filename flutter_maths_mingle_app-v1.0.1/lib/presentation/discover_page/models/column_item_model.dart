import '../../../core/app_export.dart';

/// This class is used in the [column_item_widget] screen.

class ColumnItemModel {
  ColumnItemModel({
    this.dynamicProperty1,
    this.dynamicProperty2,
    this.id,
  }) {
    dynamicProperty1 = dynamicProperty1 ?? Rx(ImageConstant.intFootball);
    dynamicProperty2 = dynamicProperty2 ?? Rx("Football");
    id = id ?? Rx("");
  }

  Rx<String>?  dynamicProperty1;

  Rx<String>? dynamicProperty2;

  Rx<String>? id;
}
