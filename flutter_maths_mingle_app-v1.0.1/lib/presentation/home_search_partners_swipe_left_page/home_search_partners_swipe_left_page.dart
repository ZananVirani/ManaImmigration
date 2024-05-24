// import 'controller/home_search_partners_swipe_left_controller.dart';
// import 'models/home_search_partners_swipe_left_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_maths_mingle_app/core/app_export.dart';
// import 'package:flutter_maths_mingle_app/widgets/custom_icon_button.dart';
//
// class HomeSearchPartnersSwipeLeftPage extends StatelessWidget {
//   HomeSearchPartnersSwipeLeftPage({Key? key})
//       : super(
//           key: key,
//         );
//
//   HomeSearchPartnersSwipeLeftController controller = Get.put(
//       HomeSearchPartnersSwipeLeftController(
//           HomeSearchPartnersSwipeLeftModel().obs));
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           width: double.maxFinite,
//           decoration: AppDecoration.white,
//           child: Column(
//             children: [
//               SizedBox(height: 14.v),
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Container(
//                   height: 478.v,
//                   width: 351.h,
//                   margin: EdgeInsets.only(right: 24.h),
//                   child: Stack(
//                     alignment: Alignment.topLeft,
//                     children: [
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: Container(
//                           margin: EdgeInsets.only(left: 24.h),
//                           padding: EdgeInsets.all(16.h),
//                           decoration:
//                               AppDecoration.outlineErrorContainer.copyWith(
//                             borderRadius: BorderRadiusStyle.roundedBorder8,
//                           ),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(
//                                 height: 299.v,
//                                 width: 295.h,
//                                 child: Stack(
//                                   alignment: Alignment.center,
//                                   children: [
//                                     CustomImageView(
//                                       imagePath: ImageConstant
//                                           .imgRectangle24966299x295,
//                                       height: 299.v,
//                                       width: 295.h,
//                                       radius: BorderRadius.circular(
//                                         8.h,
//                                       ),
//                                       alignment: Alignment.center,
//                                     ),
//                                     Align(
//                                       alignment: Alignment.center,
//                                       child: Container(
//                                         padding: EdgeInsets.symmetric(
//                                           horizontal: 8.h,
//                                           vertical: 5.v,
//                                         ),
//                                         decoration: AppDecoration
//                                             .gradientErrorContainerToErrorContainer
//                                             .copyWith(
//                                           borderRadius:
//                                               BorderRadiusStyle.roundedBorder8,
//                                         ),
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.min,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             SizedBox(height: 2.v),
//                                             Align(
//                                               alignment: Alignment.centerRight,
//                                               child: SizedBox(
//                                                 height: 48.adaptSize,
//                                                 width: 48.adaptSize,
//                                                 child: Stack(
//                                                   alignment: Alignment.center,
//                                                   children: [
//                                                     Align(
//                                                       alignment:
//                                                           Alignment.center,
//                                                       child: SizedBox(
//                                                         height: 48.adaptSize,
//                                                         width: 48.adaptSize,
//                                                         child:
//                                                             CircularProgressIndicator(
//                                                           value: 0.5,
//                                                           strokeWidth: 3.h,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Align(
//                                                       alignment:
//                                                           Alignment.center,
//                                                       child: Text(
//                                                         "lbl_50".tr,
//                                                         style: theme.textTheme
//                                                             .labelLarge,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(height: 214.v),
//                                             Text(
//                                               "lbl_2_5_km_away".tr,
//                                               style: CustomTextStyles
//                                                   .bodyLargeWhiteA700,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 11.v),
//                               Text(
//                                 "lbl_jane_cooper".tr,
//                                 style: CustomTextStyles.titleMedium17,
//                               ),
//                               SizedBox(height: 2.v),
//                               Text(
//                                 "lbl_america_usa".tr,
//                                 style: theme.textTheme.bodyMedium,
//                               ),
//                               SizedBox(height: 15.v),
//                               Align(
//                                 alignment: Alignment.center,
//                                 child: Padding(
//                                   padding:
//                                       EdgeInsets.symmetric(horizontal: 39.h),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       CustomIconButton(
//                                         height: 56.adaptSize,
//                                         width: 56.adaptSize,
//                                         padding: EdgeInsets.all(16.h),
//                                         decoration: IconButtonStyleHelper
//                                             .outlineErrorContainerTL28,
//                                         child: CustomImageView(
//                                           imagePath: ImageConstant
//                                               .imgCloseErrorcontainer,
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(left: 24.h),
//                                         child: CustomIconButton(
//                                           height: 56.adaptSize,
//                                           width: 56.adaptSize,
//                                           padding: EdgeInsets.all(16.h),
//                                           decoration:
//                                               IconButtonStyleHelper.fillPrimary,
//                                           child: CustomImageView(
//                                             imagePath:
//                                                 ImageConstant.imgFrame33642,
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(left: 24.h),
//                                         child: CustomIconButton(
//                                           height: 56.adaptSize,
//                                           width: 56.adaptSize,
//                                           padding: EdgeInsets.all(16.h),
//                                           decoration: IconButtonStyleHelper
//                                               .fillGrayTL28,
//                                           child: CustomImageView(
//                                             imagePath:
//                                                 ImageConstant.imgFavorite,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 8.v),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: SizedBox(
//                           height: 327.v,
//                           width: 285.h,
//                           child: Stack(
//                             alignment: Alignment.center,
//                             children: [
//                               CustomImageView(
//                                 imagePath:
//                                     ImageConstant.imgRectangle24966327x285,
//                                 height: 327.v,
//                                 width: 285.h,
//                                 radius: BorderRadius.circular(
//                                   8.h,
//                                 ),
//                                 alignment: Alignment.center,
//                               ),
//                               Align(
//                                 alignment: Alignment.center,
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: 56.h,
//                                     vertical: 2.v,
//                                   ),
//                                   decoration: AppDecoration
//                                       .gradientErrorContainerToErrorContainer
//                                       .copyWith(
//                                     borderRadius:
//                                         BorderRadiusStyle.roundedBorder8,
//                                   ),
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       SizedBox(height: 6.v),
//                                       Align(
//                                         alignment: Alignment.centerRight,
//                                         child: Container(
//                                           height: 55.v,
//                                           width: 52.h,
//                                           margin: EdgeInsets.only(right: 30.h),
//                                           child: Stack(
//                                             alignment: Alignment.bottomRight,
//                                             children: [
//                                               Align(
//                                                 alignment: Alignment.topCenter,
//                                                 child: SizedBox(
//                                                   height: 52.adaptSize,
//                                                   width: 52.adaptSize,
//                                                   child:
//                                                       CircularProgressIndicator(
//                                                     value: 0.5,
//                                                     strokeWidth: 3.h,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Align(
//                                                 alignment:
//                                                     Alignment.bottomRight,
//                                                 child: Container(
//                                                   width: 24.h,
//                                                   margin: EdgeInsets.only(
//                                                       right: 10.h),
//                                                   child: Text(
//                                                     "lbl_50".tr,
//                                                     maxLines: 2,
//                                                     overflow:
//                                                         TextOverflow.ellipsis,
//                                                     textAlign: TextAlign.center,
//                                                     style: theme
//                                                         .textTheme.labelLarge!
//                                                         .copyWith(
//                                                       height: 1.50,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(height: 64.v),
//                                       Container(
//                                         height: 73.adaptSize,
//                                         width: 73.adaptSize,
//                                         margin: EdgeInsets.only(left: 29.h),
//                                         padding: EdgeInsets.all(20.h),
//                                         decoration:
//                                             AppDecoration.fillPrimary.copyWith(
//                                           borderRadius:
//                                               BorderRadiusStyle.roundedBorder37,
//                                         ),
//                                         child: CustomImageView(
//                                           imagePath:
//                                               ImageConstant.imgCloseWhiteA700,
//                                           height: 31.adaptSize,
//                                           width: 31.adaptSize,
//                                           alignment: Alignment.center,
//                                         ),
//                                       ),
//                                       SizedBox(height: 63.v),
//                                       SizedBox(
//                                         width: 94.h,
//                                         child: Text(
//                                           "lbl_2_5_km_away".tr,
//                                           maxLines: 3,
//                                           overflow: TextOverflow.ellipsis,
//                                           style: CustomTextStyles
//                                               .bodyLargeWhiteA700
//                                               .copyWith(
//                                             height: 1.41,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
