// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:flutter_maths_mingle_app/presentation/bottombar_screen/controller/bottombar_screen_controller.dart';

// import '../messages_page/widgets/chatcomponent_item_widget.dart';
// import '../messages_page/widgets/frame_item_widget.dart';
import 'controller/messages_controller.dart';
// import 'models/chatcomponent_item_model.dart';
// import 'models/frame_item_model.dart';
import 'models/messages_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  MessagesController controller =
      Get.put(MessagesController(MessagesModel().obs));

  BottomBarScreenController bottomBarScreenController =
      Get.put(BottomBarScreenController());

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding:
            EdgeInsets.only(left: 24.h, right: 24.h, top: 50.h, bottom: 25.h),
        decoration:
            BoxDecoration(color: PrimaryColors().secondaryColor, boxShadow: [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 12.h,
            offset: Offset(0, 5),
            spreadRadius: 0,
          )
        ]),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                PrefData.currentIndex = 0;
                bottomBarScreenController.update();
                controller.update();
                // CommonPop.popScreen(context, RoutesPath.loginScreen);
              },
              child: Container(
                margin: EdgeInsets.only(right: 20.h),
                height: 35.h,
                width: 35.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.lightGray,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColor.black,
                  size: 18.h,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'My Liked Songs',
                style: theme.textTheme.titleLarge!.copyWith(
                  color: AppColor.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
      _buildSubMenu(),
      Expanded(
        child: ListView.builder(
          key: Key("LikedSongs"),
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          primary: true,
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (context, index) {
            bool isChecked = true;

            return StatefulBuilder(builder: (context, setState) {
              return ListTile(
                leading: Checkbox(
                    activeColor: Colors.orange,
                    fillColor: WidgetStateProperty.all(AppColor.white),
                    value: isChecked,
                    tristate: false,
                    onChanged: (newBool) {
                      setState(() => isChecked = !isChecked);
                    }),
                title: Text("Song Name"),
                subtitle: Text("Song Artist"),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text("Song Preview"),
                ),
                contentPadding: EdgeInsets.all(8.0),
                style: ListTileStyle.drawer,
              );
            });
          },
        ),
      )
    ]);
  }
}

Widget _buildSubMenu() {
  return Container(
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColor.black, width: 0.8))),
    width: double.infinity,
    height: 55.v,
    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {},
          child: Text("Select All",
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColor.black,
                wordSpacing: 0.0,
              )),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Text("Deselect All",
            style: theme.textTheme.titleSmall!.copyWith(
              color: AppColor.black,
              wordSpacing: 0.0,
            )),
      ),
      Expanded(
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text("Export to Spotify",
                style: theme.textTheme.titleSmall!.copyWith(
                  color: AppColor.black,
                  wordSpacing: 0.0,
                )),
          ),
        ),
      ),
    ]),
  );
}

  /// Row of profile pictures
  // Widget _buildFrame() {
  //   return SizedBox(
  //       height: 107.h,
  //       child: Obx(() => GridView.builder(
  //           padding: EdgeInsets.only(
  //               top: 16.h, bottom: 24.h, right: 24.h, left: 24.h),
  //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             mainAxisExtent: 67.h,
  //             crossAxisCount: 4,
  //             crossAxisSpacing: 20.h,
  //           ),
  //           itemCount:
  //               controller.messagesModelObj.value.frameItemList.value.length,
  //           itemBuilder: (context, index) {
  //             FrameItemModel model =
  //                 controller.messagesModelObj.value.frameItemList.value[index];
  //             return FrameItemWidget(model);
  //           })));
  // }

  /// Chats Logs
  // Widget _buildChatComponent() {
  //   return Obx(() => ListView.separated(
  //       padding: EdgeInsets.only(bottom: 50.h, left: 24.h, right: 24.h),
  //       physics: BouncingScrollPhysics(),
  //       shrinkWrap: true,
  //       separatorBuilder: (context, index) {
  //         return SizedBox(height: 16.h);
  //       },
  //       itemCount: controller
  //           .messagesModelObj.value.chatcomponentItemList.value.length,
  //       itemBuilder: (context, index) {
  //         ChatcomponentItemModel model = controller
  //             .messagesModelObj.value.chatcomponentItemList.value[index];
  //         return ChatcomponentItemWidget(model, onTapChatComponent: () {
  //           onTapChatComponent();
  //         });
  //       }));
  // }

  /// Navigates to the firstTimeChatScreen when the action is triggered.
  /// 
  ///    onTapChatComponent() {
    //   controller.isFirstChat
    //       ? Get.toNamed(AppRoutes.firstTimeChatScreen)
    //       : Get.toNamed(AppRoutes.firstTimeChatOneScreen);
    // }

    // /// Navigates to the previous screen.
    // onTapArrowLeft() {
    //   Get.back();
    // }

