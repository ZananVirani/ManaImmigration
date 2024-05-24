// ignore_for_file: unused_import, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_text_form_field.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import 'controller/first_time_chat_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';


class FirstTimeChatOneScreen extends GetWidget<FirstTimeChatOneController> {
  const FirstTimeChatOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FirstTimeChatOneController>(
      init: FirstTimeChatOneController(),
      builder: (controller) {
      return  Scaffold(
        appBar: PrefData.getAppBar(
            onTap: () {
              controller.clickKeyboard=false;
              controller.isVoiceChat= true;
              controller.update();
              Get.back();

            },
            text: 'Jane cooper',
            textStyle: theme.textTheme.titleLarge!.copyWith(
              color: AppColor.black,
              fontWeight: FontWeight.w700,
            ),),
        body: Column(
          children: [
            controller.isVoiceChat?
            buildVoiceView():
            buildChatView(),
        !controller.clickKeyboard? controller.isVoiceRecord?buildVoiceRecord(controller): buildThreeButton(controller):
        buildChatContainer(controller),
          ],
        ),
      );
    },);
  }

  Expanded buildVoiceView() {
    return Expanded(
            child: ListView(
                reverse: true,
                padding: EdgeInsets.only(
                  top: 16.h,
                  left: 24.h,
                  right: 24.h,
                 bottom: 24.h
                ),
                children: [





                  CustomImageView(
                    imagePath: ImageConstant.chatPersonVoiceImg,
                    margin: EdgeInsets.only(right: 52.h),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.userVoiceImg,
                    margin: EdgeInsets.only(left: 52.h,top: 16.h,bottom: 24.h),
                  ),

                  Align(
                      alignment: Alignment.center,
                      child:
                      Text("lbl_11_00_pm".tr, style: theme.textTheme.bodyMedium)),
                  CustomImageView(
                    imagePath: ImageConstant.chatPersonVoiceImg,
                    margin: EdgeInsets.only(right: 52.h,top: 24.h,bottom: 24.h),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.userVoiceImg,
                    margin: EdgeInsets.only(left: 52.h,),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.chatPersonVoiceImg,
                    margin: EdgeInsets.only(right: 52.h ,bottom: 24.h,top: 16.h),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child:
                      Text("lbl_10_00_pm".tr, style: theme.textTheme.bodyMedium)),
                ]),
          );
  }

  Expanded buildChatView() {
    return Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 24.h,left: 24.h,right: 24.h),
              children: [
                Align(
                    alignment: Alignment.center,
                    child:
                    Text("lbl_10_00_pm".tr, style: theme.textTheme.bodyMedium)),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 16.h),
                      padding: EdgeInsets.only(top: 14.h,bottom: 14.h,left: 16.h,right: 88.h),
                      decoration: BoxDecoration(
                        color: AppColor.primaryLightColor,
                        borderRadius: BorderRadius.circular(8.h),
                      ),
                      child: Text('Hello indiasn',style: CustomTextStyles.bodyLargeff000000,),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 16.h,bottom: 24.h),
                      padding: EdgeInsets.only(top: 14.h,bottom: 14.h,left: 16.h,right: 88.h),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(8.h),
                      ),
                      child: Text('Hey foreign nice to',style: CustomTextStyles.bodyLargeff000000.copyWith(
                        color:AppColor.white,
                      ),),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.center,
                    child:
                    Text("lbl_10_00_pm".tr, style: theme.textTheme.bodyMedium)),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 16.h,right: 35.h),
                        padding: EdgeInsets.only(top: 14.h,bottom: 14.h,left: 16.h,right: 16.h),
                        decoration: BoxDecoration(
                          color: AppColor.primaryLightColor,
                          borderRadius: BorderRadius.circular(8.h),
                        ),
                        child: Text('Hsing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content he',style: CustomTextStyles.bodyLargeff000000,),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }

  Container buildVoiceRecord(FirstTimeChatOneController logic) {
    return Container(

          padding: EdgeInsets.only(top: 16.h,left: 24.h,right: 24.h,bottom: 32.h),
          decoration: BoxDecoration(
            color: AppColor.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x19959595),
                blurRadius: 18,
                offset: Offset(-4, -5),
                spreadRadius: 0,
              ),
            ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                imagePath: ImageConstant.voiceWave,
                height: 40.h,
                margin: EdgeInsets.only(left: 24.h,right: 24.h,bottom: 32.h),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: CustomOutlinedButton(onPressed: () {
                          logic.isVoiceRecord= false;
                          logic.update();


                    },text: "Cancel".tr,)),
                    SizedBox(
                      width: 20.h,
                    ),
                    Expanded(
                      child: CustomElevatedButton(
                        onPressed: () {
                          logic.isVoiceRecord= false;
                          logic.update();


                        },
                        text: "Send".tr,
                      ),
                    )
                  ]),
            ],
          ),
        );
  }

  Container buildChatContainer(FirstTimeChatOneController logic) {
    return Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x19959595),
                blurRadius: 18,
                offset: Offset(-4, -5),
                spreadRadius: 0,
              ),
            ]
          ),
          padding: EdgeInsets.only(left: 24.h,right: 24.h,top: 16.h,bottom: 32.h),
          child: CustomTextFormField(
            textStyle: CustomTextStyles.bodyLargeff000000,
            controller: logic.chatController,
            prefix: CustomImageView(
              imagePath: ImageConstant.attechIc,
              height: 24.h,
              width: 24.h,
              margin: EdgeInsets.all(16.h),
            ),

            autofocus: false,
            fillColor: AppColor.lightGray,
            onChanged: (p0) {
              logic.update();
            },
            suffix: logic.chatController.text.isEmpty?GestureDetector(
              onTap: () {
                logic.isVoiceChat=true;
                logic.clickKeyboard=false;
                logic.update();
              },

              child: Container(
                margin: EdgeInsets.all(8.h),
                padding: EdgeInsets.all(8.h),
                height: 40.h,width: 40.h,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.micIc,
                  height: 24.h,
                ),
              ),
            ):
            GestureDetector(
              onTap: () {

                controller.chatController.clear();

                logic.update();
              },

              child: Container(
                margin: EdgeInsets.all(8.h),
                padding: EdgeInsets.all(8.h),
                height: 40.h,width: 40.h,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.messageSendIc,
                  height: 24.h,
                ),
              ),
            ),
          ),
        );
  }

  Padding buildThreeButton(FirstTimeChatOneController logic) {
    return Padding(
          padding: EdgeInsets.only(bottom: 32.h),
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
                      ]),
                  child: Icon(
                    Icons.close_rounded,
                    size: 24.h,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {

                  // PrefData.setClickMic(true);
                  // PrefData.setClickKeyboard(false);
                  logic.clickKeyboard= false;
                  logic.isVoiceRecord= true;
                  logic.update();

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
                      ]),
                  child: CustomImageView(
                    imagePath: ImageConstant.micIc,
                    margin: EdgeInsets.all(16.h),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {


                  // PrefData.setClickKeyboard(true);
                  // PrefData.setClickMic(false);
                  logic.clickKeyboard= true;
                  logic.isVoiceChat= false;
                  logic.update();

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
                      ]),
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
  }

  // ListView buildvoiceview() {
  //   return ListView(
  //         reverse: true,
  //         padding: EdgeInsets.only(
  //           left: 24.h,
  //           right: 24.h,
  //           bottom: 130.h,
  //         ),
  //         children: [
  //
  //
  //
  //
  //
  //           CustomImageView(
  //             imagePath: ImageConstant.chatPersonVoiceImg,
  //             margin: EdgeInsets.only(right: 52.h),
  //           ),
  //           CustomImageView(
  //             imagePath: ImageConstant.userVoiceImg,
  //             margin: EdgeInsets.only(left: 52.h,top: 16.h,bottom: 24.h),
  //           ),
  //
  //           Align(
  //               alignment: Alignment.center,
  //               child:
  //               Text("lbl_11_00_pm".tr, style: theme.textTheme.bodyMedium)),
  //           CustomImageView(
  //             imagePath: ImageConstant.chatPersonVoiceImg,
  //             margin: EdgeInsets.only(right: 52.h,top: 24.h,bottom: 24.h),
  //           ),
  //           CustomImageView(
  //             imagePath: ImageConstant.userVoiceImg,
  //             margin: EdgeInsets.only(left: 52.h,),
  //           ),
  //           CustomImageView(
  //             imagePath: ImageConstant.chatPersonVoiceImg,
  //             margin: EdgeInsets.only(right: 52.h ,bottom: 24.h),
  //           )
  //         ])
  //   ;
  // }




  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the voiceChatReplyScreen when the action is triggered.
  onTapBtnMenu() {
    Get.toNamed(
      AppRoutes.voiceChatReplyScreen,
    );
  }

  /// Navigates to the textChatScreen when the action is triggered.
  onTapBtnCalendar() {
    Get.toNamed(
      AppRoutes.textChatScreen,
    );
  }
}
