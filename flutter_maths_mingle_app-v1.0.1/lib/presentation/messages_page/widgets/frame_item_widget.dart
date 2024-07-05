import '../controller/messages_controller.dart';
import '../models/frame_item_model.dart';
import 'package:flutter/material.dart';
import 'package:Melofy/core/app_export.dart';

// ignore: must_be_immutable
class FrameItemWidget extends StatelessWidget {
  FrameItemWidget(
    this.frameItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FrameItemModel frameItemModelObj;

  var controller = Get.find<MessagesController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 67.adaptSize,
      width: 67.adaptSize,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Obx(
            () => CustomImageView(
              imagePath: frameItemModelObj.circleImage!.value,
              height: 67.adaptSize,
              width: 67.adaptSize,
              radius: BorderRadius.circular(
                33.h,
              ),
              alignment: Alignment.center,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 18.adaptSize,
              width: 18.adaptSize,
              decoration: BoxDecoration(
                color: appTheme.greenA700,
                borderRadius: BorderRadius.circular(
                  9.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
