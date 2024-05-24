import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import '../notifications_screen/widgets/notificationlist_item_widget.dart';
import 'controller/notifications_controller.dart';
import 'models/notificationlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';


class NotificationsScreen extends GetWidget<NotificationsController> {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PrefData.getAppBar(onTap: () => Get.back(),text: 'Notifications',textStyle: theme.textTheme.titleLarge!.copyWith(
          color: AppColor.black,
        )),
        body:  GetBuilder<NotificationsController>(
          init: NotificationsController(),
          builder: (controller) {
          return controller.isNotificationEmpty?Center(

            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 40.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                    CustomImageView(
                      imagePath: ImageConstant.emptyNotificationIc,
                      height: 100.h,
                    ),
                  Padding(
                    padding:  EdgeInsets.only(top: 24.h,bottom: 8.h),
                    child: Text('No notifications yet!',style: CustomTextStyles.headlineSmallff000000,),
                  ),
                  Text('We did not found any notification let’s start exploring',style:CustomTextStyles.bodyLargeff696969 ,textAlign: TextAlign.center,)
                ],
              ),
            ),
          ):buildNotificationList();
        },)
    );
  }

  ListView buildNotificationList() {
    return ListView.separated(
        padding: EdgeInsets.only(top: 16.h,left: 24.h,right: 24.h),
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 16.h);
          },
          itemCount: controller.notificationsModelObj.value
              .notificationlistItemList.value.length,
          itemBuilder: (context, index) {
            NotificationlistItemModel model = controller
                .notificationsModelObj
                .value
                .notificationlistItemList
                .value[index];
            return NotificationlistItemWidget(model);
          });
  }



  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
