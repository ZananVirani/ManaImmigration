import '../controller/notifications_controller.dart';
import '../models/notificationlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class NotificationlistItemWidget extends StatelessWidget {
  NotificationlistItemWidget(
    this.notificationlistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  NotificationlistItemModel notificationlistItemModelObj;

  var controller = Get.find<NotificationsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        16.h
      ),
      decoration: AppDecoration.outlineErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
        boxShadow: [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 12.h,
            spreadRadius: 0,
          )
        ]
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.v),
            child: CustomIconButton(
              height: 40.adaptSize,
              width: 40.adaptSize,
              padding: EdgeInsets.all(8.h),
              decoration: IconButtonStyleHelper.fillPrimaryTL20,
              child: CustomImageView(
                imagePath: ImageConstant.notificationFillIc,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    notificationlistItemModelObj.notificationText1!.value,
                    style: CustomTextStyles.titleSmallPoppins,
                  ),
                ),
                SizedBox(height: 4.h),
                Obx(
                  () => Text(
                    notificationlistItemModelObj.notificationText2!.value,
                    style: CustomTextStyles.bodyMediumPoppins,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
