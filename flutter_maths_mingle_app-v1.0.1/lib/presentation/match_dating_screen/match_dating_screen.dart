// import 'controller/match_dating_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_maths_mingle_app/core/app_export.dart';
// import 'package:flutter_maths_mingle_app/widgets/app_bar/appbar_leading_iconbutton.dart';
// import 'package:flutter_maths_mingle_app/widgets/app_bar/custom_app_bar.dart';
// import 'package:flutter_maths_mingle_app/widgets/custom_elevated_button.dart';
// import 'package:flutter_maths_mingle_app/widgets/custom_outlined_button.dart';
//
// class MatchDatingScreen extends GetWidget<MatchDatingController> {
//   const MatchDatingScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: buildIsMatched()
//     );
//   }
//
//   Scaffold buildIsMatched() {
//     return Scaffold(
//           appBar: _buildAppBar(),
//           body: Container(
//               width: double.maxFinite,
//               padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 32.v),
//               child: Column(children: [
//                 _buildFiftyStack(),
//                 SizedBox(height: 43.v),
//                 Container(
//                     width: 298.h,
//                     margin: EdgeInsets.only(left: 13.h, right: 14.h),
//                     child: RichText(
//                         text: TextSpan(children: [
//                           TextSpan(
//                               text: "lbl_you_and".tr,
//                               style: CustomTextStyles.headlineSmallff000000),
//                           TextSpan(
//                               text: "lbl_alfredo".tr,
//                               style: CustomTextStyles.headlineSmallff000000),
//                           TextSpan(
//                               text: "msg_liked_each_other".tr,
//                               style: CustomTextStyles.headlineSmallff000000)
//                         ]),
//                         textAlign: TextAlign.center)),
//                 SizedBox(height: 5.v)
//               ])),
//           bottomNavigationBar: _buildSendAMessageColumn());
//   }
//
//
//
//   /// Section Widget
//   Widget _buildFiftyStack() {
//     return SizedBox(
//         height: 356.v,
//         width: 327.h,
//         child: Stack(alignment: Alignment.bottomLeft, children: [
//           CustomImageView(
//               imagePath: ImageConstant.imgRectangle2555205x162,
//               height: 205.v,
//               width: 162.h,
//               radius: BorderRadius.circular(81.h),
//               alignment: Alignment.topRight),
//           CustomImageView(
//               imagePath: ImageConstant.imgRectangle2556205x162,
//               height: 205.v,
//               width: 162.h,
//               radius: BorderRadius.circular(81.h),
//               alignment: Alignment.bottomLeft),
//           Align(
//               alignment: Alignment.center,
//               child: Card(
//                   clipBehavior: Clip.antiAlias,
//                   elevation: 0,
//                   margin: EdgeInsets.all(0),
//                   color: appTheme.whiteA700,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadiusStyle.circleBorder58),
//                   child: Container(
//                       height: 116.adaptSize,
//                       width: 116.adaptSize,
//                       padding: EdgeInsets.all(22.h),
//                       decoration: AppDecoration.outlineErrorContainer.copyWith(
//                           borderRadius: BorderRadiusStyle.circleBorder58),
//                       child: Stack(alignment: Alignment.center, children: [
//                         Align(
//                             alignment: Alignment.center,
//                             child: SizedBox(
//                                 height: 72.adaptSize,
//                                 width: 72.adaptSize,
//                                 child: CircularProgressIndicator(
//                                     value: 0.5, strokeWidth: 7.h))),
//                         Align(
//                             alignment: Alignment.center,
//                             child: Text("lbl_50".tr,
//                                 style: CustomTextStyles.titleSmallPrimary))
//                       ]))))
//         ]));
//   }
//
//   /// Section Widget
//   Widget _buildSendAMessageColumn() {
//     return Container(
//         margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 24.v),
//         decoration: AppDecoration.white,
//         child: Column(mainAxisSize: MainAxisSize.min, children: [
//           CustomElevatedButton(
//               text: "lbl_send_a_message".tr,
//               onPressed: () {
//                 onTapSendAMessage();
//               }),
//           CustomOutlinedButton(
//               text: "lbl_keep_swiping".tr,
//               margin: EdgeInsets.only(top: 16.v),
//               onPressed: () {
//                 onTapKeepSwiping();
//               })
//         ]));
//   }
//
//   /// Navigates to the previous screen.
//   onTapArrowLeft() {
//     Get.back();
//   }
//
//   /// Navigates to the firstTimeChatScreen when the action is triggered.
//   onTapSendAMessage() {
//     Get.toNamed(
//       AppRoutes.firstTimeChatScreen,
//     );
//   }
//
//   /// Navigates to the connectMakeFriendsScreen when the action is triggered.
//   onTapKeepSwiping() {
//     Get.toNamed(
//       AppRoutes.connectMakeFriendsScreen,
//     );
//   }
// }
