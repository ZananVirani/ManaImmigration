// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:flutter_maths_mingle_app/presentation/bottombar_screen/controller/bottombar_screen_controller.dart';

import '../messages_page/widgets/chatcomponent_item_widget.dart';
import '../messages_page/widgets/frame_item_widget.dart';
import 'controller/messages_controller.dart';
import 'models/chatcomponent_item_model.dart';
import 'models/frame_item_model.dart';
import 'models/messages_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';


// ignore_for_file: must_be_immutable
class MessagesPage extends StatelessWidget {
  MessagesPage({Key? key}) : super(key: key);

  MessagesController controller =
      Get.put(MessagesController(MessagesModel().obs));

  BottomBarScreenController bottomBarScreenController = Get.put(BottomBarScreenController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(

            padding: EdgeInsets.only(left: 24.h,right: 24.h,top: 60.h,bottom: 16.h),
            decoration: BoxDecoration(
              color: AppColor.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x11000000),
                  blurRadius: 12.h,
                  offset: Offset(0, 5),
                  spreadRadius: 0,
                )
              ]
            ),
            child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      PrefData.currentIndex=0;
                    bottomBarScreenController.update();
                    controller.update();
                      // CommonPop.popScreen(context, RoutesPath.loginScreen);
                    },
                    child: Container(
                     margin: EdgeInsets.only(right: 16.h),
                      height: 40.h,
                      width: 40.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.lightGray,
                      ),
                      child:Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColor.black,
                        size: 18.h,
                      ),
                    ),
                  ),


                  Text(
                    'Chat',
                    style:theme.textTheme.titleLarge!.copyWith(
                      color: AppColor.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],

            ),
          ),

         Expanded(
           child: ListView(
             shrinkWrap: true,
             physics: BouncingScrollPhysics(),
             primary: true,
             padding: EdgeInsets.zero,
             children: [
               Padding(
                   padding: EdgeInsets.only(left: 24.h,right: 24.h,top: 16.h) ,
                   child: Text("lbl_recent_matches".tr,
                       style: theme.textTheme.titleMedium!.copyWith(
                         color: AppColor.black,
                       ))),
           
               _buildFrame(),
           
               _buildChatComponent()
             ],
           ),
         )
        ]);
  }



  /// Section Widget
  Widget _buildFrame() {
    return SizedBox(
        height: 107.h,
        child: Obx(() => GridView.builder(
            padding: EdgeInsets.only(top: 16.h,bottom: 24.h,right: 24.h,left: 24.h),

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 67.h,
                crossAxisCount: 4,
                crossAxisSpacing: 20.h,

                ),
            itemCount:
                controller.messagesModelObj.value.frameItemList.value.length,
            itemBuilder: (context, index) {
              FrameItemModel model =
                  controller.messagesModelObj.value.frameItemList.value[index];
              return FrameItemWidget(model);
            })));
  }

  /// Section Widget
  Widget _buildChatComponent() {
    return Obx(() => ListView.separated(
      padding: EdgeInsets.only(bottom: 50.h,left: 24.h,right: 24.h)  ,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 16.h);
        },
        itemCount: controller
            .messagesModelObj.value.chatcomponentItemList.value.length,
        itemBuilder: (context, index) {
          ChatcomponentItemModel model = controller
              .messagesModelObj.value.chatcomponentItemList.value[index];
          return ChatcomponentItemWidget(model, onTapChatComponent: () {
            onTapChatComponent();
          });
        }));
  }

  /// Navigates to the firstTimeChatScreen when the action is triggered.
  onTapChatComponent() {
    controller.isFirstChat? Get.toNamed(AppRoutes.firstTimeChatScreen):Get.toNamed(AppRoutes.firstTimeChatOneScreen);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
