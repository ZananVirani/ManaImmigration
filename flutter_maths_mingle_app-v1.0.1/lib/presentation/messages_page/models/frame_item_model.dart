import '../../../core/app_export.dart';/// This class is used in the [frame_item_widget] screen.
class FrameItemModel {FrameItemModel({this.circleImage, this.id, }) { circleImage = circleImage  ?? Rx(ImageConstant.imgEllipse139);id = id  ?? Rx(""); }

Rx<String>? circleImage;

Rx<String>? id;

 }
