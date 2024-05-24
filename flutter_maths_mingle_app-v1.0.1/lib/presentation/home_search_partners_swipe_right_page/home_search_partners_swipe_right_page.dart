// import 'controller/home_search_partners_swipe_right_controller.dart';
// import 'models/home_search_partners_swipe_right_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_maths_mingle_app/core/app_export.dart';
// import 'package:flutter_maths_mingle_app/widgets/custom_icon_button.dart';
//
// // ignore_for_file: must_be_immutable
// class HomeSearchPartnersSwipeRightPage extends StatelessWidget {
//   HomeSearchPartnersSwipeRightPage({Key? key}) : super(key: key);
//
//   HomeSearchPartnersSwipeRightController controller = Get.put(
//       HomeSearchPartnersSwipeRightController(
//           HomeSearchPartnersSwipeRightModel().obs));
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             body: Container(
//                 width: double.maxFinite,
//                 decoration: AppDecoration.white,
//                 child: Column(
//                     children: [SizedBox(height: 12.v), _buildFifty()]))));
//   }
//
//   /// Section Widget
//   Widget _buildFifty() {
//     return Align(
//         alignment: Alignment.topRight,
//         child: Container(
//             height: 480.v,
//             width: 351.h,
//             margin: EdgeInsets.only(left: 24.h),
//             child: Stack(alignment: Alignment.topRight, children: [
//               Align(
//                   alignment: Alignment.centerLeft,
//                   child: Container(
//                       margin: EdgeInsets.only(right: 24.h),
//                       padding: EdgeInsets.all(16.h),
//                       decoration: AppDecoration.outlineErrorContainer.copyWith(
//                           borderRadius: BorderRadiusStyle.roundedBorder8),
//                       child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                                 height: 299.v,
//                                 width: 295.h,
//                                 child: Stack(
//                                     alignment: Alignment.center,
//                                     children: [
//                                       CustomImageView(
//                                           imagePath: ImageConstant
//                                               .imgRectangle24966299x295,
//                                           height: 299.v,
//                                           width: 295.h,
//                                           radius: BorderRadius.circular(8.h),
//                                           alignment: Alignment.center),
//                                       Align(
//                                           alignment: Alignment.center,
//                                           child: Container(
//                                               padding: EdgeInsets.symmetric(
//                                                   horizontal: 8.h,
//                                                   vertical: 5.v),
//                                               decoration: AppDecoration
//                                                   .gradientErrorContainerToErrorContainer
//                                                   .copyWith(
//                                                       borderRadius:
//                                                           BorderRadiusStyle
//                                                               .roundedBorder8),
//                                               child: Column(
//                                                   mainAxisSize:
//                                                       MainAxisSize.min,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   children: [
//                                                     SizedBox(height: 2.v),
//                                                     Align(
//                                                         alignment: Alignment
//                                                             .centerRight,
//                                                         child: SizedBox(
//                                                             height:
//                                                                 48.adaptSize,
//                                                             width: 48.adaptSize,
//                                                             child: Stack(
//                                                                 alignment:
//                                                                     Alignment
//                                                                         .center,
//                                                                 children: [
//                                                                   Align(
//                                                                       alignment:
//                                                                           Alignment
//                                                                               .center,
//                                                                       child: SizedBox(
//                                                                           height: 48
//                                                                               .adaptSize,
//                                                                           width: 48
//                                                                               .adaptSize,
//                                                                           child: CircularProgressIndicator(
//                                                                               value: 0.5,
//                                                                               strokeWidth: 3.h))),
//                                                                   Align(
//                                                                       alignment:
//                                                                           Alignment
//                                                                               .center,
//                                                                       child: Text(
//                                                                           "lbl_50"
//                                                                               .tr,
//                                                                           style: theme
//                                                                               .textTheme
//                                                                               .labelLarge))
//                                                                 ]))),
//                                                     SizedBox(height: 214.v),
//                                                     Text("lbl_2_5_km_away".tr,
//                                                         style: CustomTextStyles
//                                                             .bodyLargeWhiteA700)
//                                                   ])))
//                                     ])),
//                             SizedBox(height: 11.v),
//                             Text("lbl_jane_cooper".tr,
//                                 style: CustomTextStyles.titleMedium17),
//                             SizedBox(height: 2.v),
//                             Text("lbl_america_usa".tr,
//                                 style: theme.textTheme.bodyMedium),
//                             SizedBox(height: 15.v),
//                             Align(
//                                 alignment: Alignment.center,
//                                 child: Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 39.h),
//                                     child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           CustomIconButton(
//                                               height: 56.adaptSize,
//                                               width: 56.adaptSize,
//                                               padding: EdgeInsets.all(16.h),
//                                               decoration: IconButtonStyleHelper
//                                                   .outlineErrorContainerTL28,
//                                               onTap: () {
//                                                 onTapBtnClose();
//                                               },
//                                               child: CustomImageView(
//                                                   imagePath: ImageConstant
//                                                       .imgCloseErrorcontainer)),
//                                           Padding(
//                                               padding:
//                                                   EdgeInsets.only(left: 24.h),
//                                               child: CustomIconButton(
//                                                   height: 56.adaptSize,
//                                                   width: 56.adaptSize,
//                                                   padding: EdgeInsets.all(16.h),
//                                                   decoration:
//                                                       IconButtonStyleHelper
//                                                           .fillPrimary,
//                                                   child: CustomImageView(
//                                                       imagePath: ImageConstant
//                                                           .imgFrame33642))),
//                                           Padding(
//                                               padding:
//                                                   EdgeInsets.only(left: 24.h),
//                                               child: CustomIconButton(
//                                                   height: 56.adaptSize,
//                                                   width: 56.adaptSize,
//                                                   padding: EdgeInsets.all(16.h),
//                                                   decoration:
//                                                       IconButtonStyleHelper
//                                                           .fillGrayTL28,
//                                                   child: CustomImageView(
//                                                       imagePath: ImageConstant
//                                                           .imgFavorite)))
//                                         ]))),
//                             SizedBox(height: 8.v)
//                           ]))),
//               Align(
//                   alignment: Alignment.topRight,
//                   child: SizedBox(
//                       height: 331.v,
//                       width: 286.h,
//                       child: Stack(alignment: Alignment.center, children: [
//                         CustomImageView(
//                             imagePath: ImageConstant.imgRectangle24966331x286,
//                             height: 331.v,
//                             width: 286.h,
//                             radius: BorderRadius.circular(8.h),
//                             alignment: Alignment.center),
//                         Align(
//                             alignment: Alignment.center,
//                             child: Container(
//                                 padding: EdgeInsets.symmetric(vertical: 60.v),
//                                 decoration: AppDecoration
//                                     .gradientErrorContainerToErrorContainer
//                                     .copyWith(
//                                         borderRadius:
//                                             BorderRadiusStyle.roundedBorder8),
//                                 child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                           width: 92.h,
//                                           margin: EdgeInsets.only(
//                                               left: 8.h, top: 146.v),
//                                           child: Text("lbl_2_5_km_away".tr,
//                                               maxLines: 3,
//                                               overflow: TextOverflow.ellipsis,
//                                               style: CustomTextStyles
//                                                   .bodyLargeWhiteA700
//                                                   .copyWith(height: 1.41))),
//                                       Container(
//                                           height: 75.adaptSize,
//                                           width: 75.adaptSize,
//                                           margin: EdgeInsets.only(
//                                               left: 26.h,
//                                               top: 69.v,
//                                               bottom: 64.v),
//                                           padding: EdgeInsets.all(21.h),
//                                           decoration: AppDecoration.fillPrimary
//                                               .copyWith(
//                                                   borderRadius:
//                                                       BorderRadiusStyle
//                                                           .roundedBorder37),
//                                           // child: CustomImageView(
//                                           //     imagePath: ImageConstant
//                                           //         .imgUserWhiteA700,
//                                           //     height: 32.adaptSize,
//                                           //     width: 32.adaptSize,
//                                           //     alignment: Alignment.center)
//                                       ),
//                                       Spacer(),
//                                       Container(
//                                           height: 55.v,
//                                           width: 18.h,
//                                           margin: EdgeInsets.only(
//                                               top: 29.v, bottom: 124.v),
//                                           child: Stack(
//                                               alignment: Alignment.bottomRight,
//                                               children: [
//                                                 Align(
//                                                     alignment:
//                                                         Alignment.topCenter,
//                                                     child: SizedBox(
//                                                         height: 53.v,
//                                                         width: 18.h,
//                                                         child:
//                                                             CircularProgressIndicator(
//                                                                 value: 0.5,
//                                                                 strokeWidth:
//                                                                     3.h))),
//                                                 Align(
//                                                     alignment:
//                                                         Alignment.bottomRight,
//                                                     child: SizedBox(
//                                                         width: 5.h,
//                                                         child: Text("lbl_50".tr,
//                                                             maxLines: 2,
//                                                             overflow:
//                                                                 TextOverflow
//                                                                     .ellipsis,
//                                                             textAlign: TextAlign
//                                                                 .center,
//                                                             style: theme
//                                                                 .textTheme
//                                                                 .labelLarge!
//                                                                 .copyWith(
//                                                                     height:
//                                                                         1.50))))
//                                               ]))
//                                     ])))
//                       ])))
//             ])));
//   }
//
//   /// Navigates to the homeSearchPartnersSwipeLeftTabContainerScreen when the action is triggered.
//   onTapBtnClose() {
//     Get.toNamed(
//       AppRoutes.homeSearchPartnersSwipeLeftTabContainerScreen,
//     );
//   }
// }
