// ignore_for_file: must_be_immutable, unnecessary_import, duplicate_ignore

// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_drop_down.dart';
import 'package:flutter_maths_mingle_app/presentation/logout_dialog/logout_dialog.dart';
import 'package:flutter_maths_mingle_app/presentation/logout_dialog/controller/logout_controller.dart';

class SettingsScreen extends GetWidget<SettingsController> {
   SettingsScreen({Key? key}) : super(key: key);

  double distance = 25.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:PrefData.getAppBar(onTap: () => Get.back(),text: 'Settings'),
        body: Column(children: [
         Expanded(
           child: ListView(
             padding: EdgeInsets.only(top: 16.h),

             children: [
               buildDiscText(),

               buildSelectLocation(),

               GetBuilder<SettingsController>(
                 init: SettingsController(),
                 builder: (logic) {
                 return Padding(
                     padding: EdgeInsets.only(left: 24.h,right: 32.h),
                     child:
                     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                       Text("lbl_distance".tr, style: theme.textTheme.titleLarge!.copyWith(
                         color: AppColor.black,
                       )),
                       Padding(
                           padding: EdgeInsets.only(top: 2.v),
                           child: Text("${logic.distanceValue.toDoubleValue(fractionDigits: 2)} KM".tr,
                               style: CustomTextStyles.bodyLargePrimary))
                     ]));
               },),

               GetBuilder<SettingsController>(
                 init: SettingsController(),
                 builder: (controllers) {
                   return Padding(
                     padding:  EdgeInsets.symmetric(horizontal: 8.h),
                     child: SfSlider(

                       min: 0.5,
                       max: 100.0,
                       value: controllers.distanceValue,
                       showTicks: false,
                       showLabels: false,
                       enableTooltip: true,
                       activeColor: AppColor.primaryColor,
                       inactiveColor: Color(0xFFF4F4F4),
                       thumbIcon: CustomImageView(
                         imagePath: ImageConstant.sliderThumb,
                         height: 28.adaptSize,
                         width: 48.adaptSize,
                       ),
                       onChanged: (dynamic value) {
                         controllers.update();
                         controllers.distanceValue = value;
                         controllers.update();
                         // print('value cghanges --$value---$_value');
                       },
                     ),
                   );
                 },
               ),

               Container(
                 margin: EdgeInsets.only(left: 24.h,right: 24.h,top: 16.h),
                 padding: EdgeInsets.all(16.h),
                 decoration: BoxDecoration(
                   color: AppColor.lightGray,
                   borderRadius: BorderRadius.circular(8.h),
                 ),
                 child: Row(
                   children: [
                     Expanded(
                       child: Text('Please enter valid email address',style: theme.textTheme.titleSmall!.copyWith(
                         color: AppColor.black40,
                         fontWeight: FontWeight.w400,
                       ),),
                     ),
                     GetBuilder<SettingsController>(
                       init: SettingsController(),
                       builder: (controller) {
                         return FlutterSwitch(
                           width: 40.h,
                           height: 24.h,
                           value: controller.peopleRange,
                           activeColor: AppColor.primaryColor,
                           inactiveColor: AppColor.black20,

                           padding: 2.h,
                           showOnOff: false,
                           onToggle: (val) {
                             controller.peopleRange = val;
                             controller.update();
                           },
                         );
                       },)
                   ],
                 ),
               ),

               Align(
                   alignment: Alignment.centerLeft,
                   child: Padding(
                     padding:  EdgeInsets.only(top: 24.h,bottom: 16.h,left: 24.h,right: 24.h),
                     child: Text("lbl_privacy".tr,
                         style: theme.textTheme.titleMedium!.copyWith(
                           color: AppColor.black,
                         )),
                   )),

               GestureDetector(
                 onTap: () {
                   Get.toNamed(AppRoutes.notificationsScreen);
                 },
                 child: Container(
                     padding: EdgeInsets.all(16.h),
                     margin: EdgeInsets.only(left: 24.h,right: 24.h,bottom: 16.h),
                     decoration: AppDecoration.outlineErrorContainer
                         .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8,
                         boxShadow: [
                           BoxShadow(
                             color: Color(0x11000000),
                             blurRadius: 12.h,
                             spreadRadius: 0,
                           )
                         ]
                     ),
                     child: Row(children: [

                       Expanded(
                         child: Text("Notifications".tr,
                             style: theme.textTheme.bodyLarge),
                       ),

                       CustomImageView(
                         imagePath: ImageConstant.arrowRightIc,
                         height: 20.h,
                       )
                     ])),
               ),

               GestureDetector(
                 onTap: () {
                   Get.toNamed(AppRoutes.privacyPolicyScreen);
                 },
                 child: Container(
                     padding: EdgeInsets.all(16.h),
                     margin: EdgeInsets.only(left: 24.h,right: 24.h,bottom: 16.h),
                     decoration: AppDecoration.outlineErrorContainer
                         .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8,
                         boxShadow: [
                           BoxShadow(
                             color: Color(0x11000000),
                             blurRadius: 12.h,
                             spreadRadius: 0,
                           )
                         ]
                     ),
                     child: Row(children: [

                       Expanded(
                         child: Text("Privacy policy".tr,
                             style: theme.textTheme.bodyLarge),
                       ),

                       CustomImageView(
                         imagePath: ImageConstant.arrowRightIc,
                         height: 20.h,
                       )
                     ])),
               ),
             ],
           ),
         ),
          GestureDetector(
              onTap: () {
                onTapTxtLogout();
              },
              child: Padding(
                padding:  EdgeInsets.only(bottom: 50.h),
                child: Text("lbl_logout".tr,
                    style: CustomTextStyles.titleMediumRed500),
              ))
        ]));
  }

  Padding buildSelectLocation() {
    return Padding(
                padding: EdgeInsets.only(
                    top: 16.h, bottom: 24.h, left: 24.h, right: 24.h),
                child: CustomDropDown(
                    icon: CustomImageView(
                        imagePath: ImageConstant.arrowDownIc,
                        height: 24.adaptSize,
                        width: 24.adaptSize),
                    hintText: "lbl_location".tr,
                    items: controller
                        .settingsModelObj.value.dropdownItemList.value,
                    onChanged: (value) {
                      controller.onSelected(value);
                    }),
              );
  }

  Align buildDiscText() {
    return Align(
                 alignment: Alignment.centerLeft,
                 child: Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 24.h),
                   child: Text("msg_discovery_settings".tr,
                       style: theme.textTheme.titleMedium!.copyWith(
                         color: AppColor.black,
                       )),
                 ));
  }



  // /// Section Widget
  // Widget _buildFrame() {
  //   return Padding(
  //       padding: EdgeInsets.only(left: 24.h,right: 32.h),
  //       child:
  //           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  //         Text("lbl_distance".tr, style: theme.textTheme.titleLarge!.copyWith(
  //           color: AppColor.black,
  //         )),
  //         Padding(
  //             padding: EdgeInsets.only(top: 2.v),
  //             child: Text("lbl_10_km".tr,
  //                 style: CustomTextStyles.bodyLargePrimary))
  //       ]));
  // }





  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the notificationsScreen when the action is triggered.
  onTapNotifications() {
    Get.toNamed(
      AppRoutes.notificationsScreen,
    );
  }

  /// Navigates to the privacyPolicyScreen when the action is triggered.
  onTapPrivacyPolicy() {
    Get.toNamed(
      AppRoutes.privacyPolicyScreen,
    );
  }

  /// Displays a dialog with the [LogoutDialog] content.
  onTapTxtLogout() {
    Get.dialog(AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.only(left: 0),
      content: LogoutDialog(
        Get.put(
          LogoutController(),
        ),
      ),
    ));
  }
}
