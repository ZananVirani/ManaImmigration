import '../../../core/app_export.dart';/// This class is used in the [userprofile2_item_widget] screen.
class Userprofile2ItemModel {Userprofile2ItemModel({this.userImage, this.userName, this.userText, this.id, }) { userImage = userImage  ?? Rx(ImageConstant.imgRectangle24968);userName = userName  ?? Rx("Kenneth");userText = userText  ?? Rx("Bgeyj");id = id  ?? Rx(""); }

Rx<String>? userImage;

Rx<String>? userName;

Rx<String>? userText;

Rx<String>? id;

 }
