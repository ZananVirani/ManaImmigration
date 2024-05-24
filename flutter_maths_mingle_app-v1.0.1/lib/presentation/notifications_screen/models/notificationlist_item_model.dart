import '../../../core/app_export.dart';/// This class is used in the [notificationlist_item_widget] screen.
class NotificationlistItemModel {NotificationlistItemModel({this.notificationText1, this.notificationText2, this.id, }) { notificationText1 = notificationText1  ?? Rx("There are many synonyms");notificationText2 = notificationText2  ?? Rx("5 mins ago");id = id  ?? Rx(""); }

Rx<String>? notificationText1;

Rx<String>? notificationText2;

Rx<String>? id;

 }
