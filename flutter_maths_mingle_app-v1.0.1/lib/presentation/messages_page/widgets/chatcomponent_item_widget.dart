import '../controller/messages_controller.dart';
import '../models/chatcomponent_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

// ignore: must_be_immutable
class ChatcomponentItemWidget extends StatelessWidget {
  ChatcomponentItemWidget(
    this.chatcomponentItemModelObj, {
    Key? key,
    this.onTapChatComponent,
  }) : super(
          key: key,
        );

  ChatcomponentItemModel chatcomponentItemModelObj;

  var controller = Get.find<MessagesController>();

  VoidCallback? onTapChatComponent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapChatComponent!.call();
      },
      child: Container(
        padding: EdgeInsets.all(12.h),
        decoration: AppDecoration.outlineErrorContainer.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
          boxShadow: [
            BoxShadow(
              color: Color(0x11000000),
              blurRadius: 16.h,

              spreadRadius: 0,
            )
          ]
        ),
        child: Row(
          children: [
            Obx(
              () => CustomImageView(
                imagePath: chatcomponentItemModelObj.userImage!.value,
                height: 48.adaptSize,
                width: 48.adaptSize,
                radius: BorderRadius.circular(
                  24.h,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      chatcomponentItemModelObj.userName!.value,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(height: 4.v),
                  Obx(
                    () => Text(
                      chatcomponentItemModelObj.questionText!.value,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
