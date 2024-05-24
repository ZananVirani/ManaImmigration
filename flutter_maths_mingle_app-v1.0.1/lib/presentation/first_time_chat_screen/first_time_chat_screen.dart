// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:flutter_maths_mingle_app/presentation/first_time_chat_one_screen/controller/first_time_chat_one_controller.dart';
import 'controller/first_time_chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_elevated_button.dart';

class FirstTimeChatScreen extends GetWidget<FirstTimeChatController> {
  const FirstTimeChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:PrefData.getAppBar(onTap: () => Get.back(),text: ''),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

          CustomImageView(
              imagePath: ImageConstant.imgRectangle2555140x140,
              height: 140.adaptSize,
              width: 140.adaptSize,
              radius: BorderRadius.circular(70.h)),
          SizedBox(height: 18.v),
          Text("msg_you_connected_with".tr,
              style: theme.textTheme.titleMedium),
          SizedBox(height: 10.v),
          Text("lbl_15_mins_ago".tr,
              style: CustomTextStyles.bodyLargeGray700),
          SizedBox(height: 21.v),
          CustomElevatedButton(
              height: 46.v,
              width: 189.h,
              text: "msg_get_read_receipts".tr,
              buttonTextStyle: CustomTextStyles.titleMediumWhiteA700),
              Row(),


        ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GetBuilder<FirstTimeChatOneController>(
        init: FirstTimeChatOneController(),
        builder: (logic) {
        return Padding(
          padding:  EdgeInsets.only(bottom: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 56.h,
                  height: 56.h,
                  decoration: BoxDecoration(
                      color: AppColor.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x11000000),
                          blurRadius: 16,

                          spreadRadius: 0,
                        )
                      ]
                  ),
                  child: Icon(Icons.close_rounded,size: 24.h,),

                ),
              ),
              GestureDetector(
                onTap: (){

                  PrefData.setChatFirstTime(false);
                 logic.isVoiceChat=true;
                 logic.clickKeyboard=false;
                  Get.toNamed(AppRoutes.firstTimeChatOneScreen);

                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.h),

                  width: 56.h,
                  height: 56.h,
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x11000000),
                          blurRadius: 16,

                          spreadRadius: 0,
                        )
                      ]
                  ),

                  child: CustomImageView(
                    imagePath: ImageConstant.micIc,

                    margin: EdgeInsets.all(16.h),
                  ),

                ),
              ),
              GestureDetector(
                onTap: (){
                  PrefData.setChatFirstTime(false);
                  logic.isVoiceChat=false;
                  logic.clickKeyboard=true;
                  Get.toNamed(AppRoutes.firstTimeChatOneScreen);
                },
                child: Container(

                  width: 56.h,
                  height: 56.h,
                  decoration: BoxDecoration(
                      color: AppColor.primaryLightColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x11000000),
                          blurRadius: 16,

                          spreadRadius: 0,
                        )
                      ]
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.chatIc,
                    color: AppColor.primaryColor,

                    margin: EdgeInsets.all(16.h),
                  ),

                ),
              ),
            ],
          ),
        );
      },)
    );
  }


  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the firstTimeChatOneScreen when the action is triggered.
  onTapBtnMenu() {
    Get.toNamed(
      AppRoutes.firstTimeChatOneScreen,
    );
  }
}
