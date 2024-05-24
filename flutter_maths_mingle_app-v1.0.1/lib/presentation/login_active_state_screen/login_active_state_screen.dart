// import 'controller/login_active_state_controller.dart';
// import 'package:country_pickers/country.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_maths_mingle_app/core/app_export.dart';
// import 'package:flutter_maths_mingle_app/widgets/app_bar/appbar_leading_iconbutton.dart';
// import 'package:flutter_maths_mingle_app/widgets/app_bar/appbar_subtitle.dart';
// import 'package:flutter_maths_mingle_app/widgets/app_bar/custom_app_bar.dart';
// import 'package:flutter_maths_mingle_app/widgets/custom_elevated_button.dart';
// import 'package:flutter_maths_mingle_app/widgets/custom_phone_number.dart';
//
// class LoginActiveStateScreen extends GetWidget<LoginActiveStateController> {
//   const LoginActiveStateScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             resizeToAvoidBottomInset: false,
//             appBar: _buildAppBar(),
//             body: Container(
//                 width: double.maxFinite,
//                 padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 19.v),
//                 child: Column(children: [
//                   Align(
//                       alignment: Alignment.centerLeft,
//                       child: Padding(
//                           padding: EdgeInsets.only(left: 1.h),
//                           child: Text("msg_enter_your_phone".tr,
//                               style: theme.textTheme.bodyLarge))),
//                   SizedBox(height: 29.v),
//                   _buildPhoneNumber(),
//                   SizedBox(height: 48.v),
//                   _buildLogin(),
//                   SizedBox(height: 33.v),
//                   _buildFrame(),
//                   SizedBox(height: 22.v),
//                   _buildFrame1(),
//                   Spacer(),
//                   SizedBox(height: 27.v),
//                   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                     Padding(
//                         padding: EdgeInsets.only(bottom: 1.v),
//                         child: Text("msg_don_t_have_an_account".tr,
//                             style: theme.textTheme.bodyMedium)),
//                     Padding(
//                         padding: EdgeInsets.only(left: 4.h),
//                         child: Text("lbl_sign_up".tr,
//                             style: CustomTextStyles.titleSmallPrimary))
//                   ])
//                 ]))));
//   }
//
//   /// Section Widget
//   PreferredSizeWidget _buildAppBar() {
//     return CustomAppBar(
//         leadingWidth: 64.h,
//         leading: AppbarLeadingIconbutton(
//             imagePath: ImageConstant.imgArrowLeft,
//             margin: EdgeInsets.only(left: 24.h, top: 16.v, bottom: 16.v),
//             onTap: () {
//               onTapArrowLeft();
//             }),
//         title: AppbarSubtitle(
//             text: "lbl_login".tr, margin: EdgeInsets.only(left: 16.h)),
//         styleType: Style.bgShadow);
//   }
//
//   /// Section Widget
//   Widget _buildPhoneNumber() {
//     return Obx(() => CustomPhoneNumber(
//         country: controller.selectedCountry.value,
//         controller: controller.phoneNumberController,
//         onTap: (Country value) {
//           controller.selectedCountry.value = value;
//         }));
//   }
//
//   /// Section Widget
//   Widget _buildLogin() {
//     return CustomElevatedButton(
//         text: "lbl_login".tr,
//         onPressed: () {
//           onTapLogin();
//         });
//   }
//
//   /// Section Widget
//   Widget _buildFrame() {
//     return Padding(
//         padding: EdgeInsets.only(left: 1.h),
//         child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Opacity(
//                   opacity: 0.5,
//                   child: Padding(
//                       padding: EdgeInsets.only(top: 8.v, bottom: 11.v),
//                       child: SizedBox(width: 105.h, child: Divider()))),
//               Text("lbl_login_with".tr, style: theme.textTheme.bodyMedium),
//               Opacity(
//                   opacity: 0.5,
//                   child: Padding(
//                       padding: EdgeInsets.only(top: 8.v, bottom: 11.v),
//                       child: SizedBox(width: 105.h, child: Divider())))
//             ]));
//   }
//
//   /// Section Widget
//   Widget _buildGoogle() {
//     return CustomElevatedButton(
//         width: 154.h,
//         text: "lbl_google".tr,
//         leftIcon: Container(
//             margin: EdgeInsets.only(right: 8.h),
//             child: CustomImageView(
//                 imagePath: ImageConstant.imgFlatcoloriconsgoogle,
//                 height: 24.adaptSize,
//                 width: 24.adaptSize)),
//         buttonStyle: CustomButtonStyles.fillPrimary,
//         buttonTextStyle: theme.textTheme.bodyLarge!);
//   }
//
//   /// Section Widget
//   Widget _buildApple() {
//     return CustomElevatedButton(
//         width: 153.h,
//         text: "lbl_apple".tr,
//         leftIcon: Container(
//             margin: EdgeInsets.only(right: 8.h),
//             child: CustomImageView(
//                 imagePath: ImageConstant.imgAntdesignapplefilled,
//                 height: 24.adaptSize,
//                 width: 24.adaptSize)),
//         buttonStyle: CustomButtonStyles.fillPrimary,
//         buttonTextStyle: theme.textTheme.bodyLarge!);
//   }
//
//   /// Section Widget
//   Widget _buildFrame1() {
//     return Padding(
//         padding: EdgeInsets.only(left: 1.h),
//         child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [_buildGoogle(), _buildApple()]));
//   }
//
//   /// Navigates to the previous screen.
//   onTapArrowLeft() {
//     Get.back();
//   }
//
//   /// Navigates to the loginOtpAuthenticationScreen when the action is triggered.
//   onTapLogin() {
//     Get.toNamed(
//       AppRoutes.loginOtpAuthenticationScreen,
//     );
//   }
// }
