import '../../../core/app_export.dart';/// This class is used in the [chatcomponent_item_widget] screen.
class ChatcomponentItemModel {ChatcomponentItemModel({this.userImage, this.userName, this.questionText, this.id, }) { userImage = userImage  ?? Rx(ImageConstant.imgEllipse24);userName = userName  ?? Rx("Wade Warren");questionText = questionText  ?? Rx("What door nis the back");id = id  ?? Rx(""); }

Rx<String>? userImage;

Rx<String>? userName;

Rx<String>? questionText;

Rx<String>? id;

 }
