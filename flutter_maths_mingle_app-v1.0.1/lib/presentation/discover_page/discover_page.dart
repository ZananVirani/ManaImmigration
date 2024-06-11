// // ignore_for_file: unused_import

// import '../discover_page/widgets/column_item_widget.dart';
// import '../discover_page/widgets/userprofile2_item_widget.dart';
// import 'controller/discover_controller.dart';
// import 'models/column_item_model.dart';
// import 'models/discover_model.dart';
// import 'models/userprofile2_item_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_maths_mingle_app/core/app_export.dart';
// import 'package:flutter_maths_mingle_app/widgets/app_bar/appbar_subtitle_one.dart';
// import 'package:flutter_maths_mingle_app/widgets/app_bar/appbar_title.dart';
// import 'package:flutter_maths_mingle_app/widgets/app_bar/appbar_trailing_iconbutton.dart';
// import 'package:flutter_maths_mingle_app/widgets/app_bar/custom_app_bar.dart';

// // ignore_for_file: must_be_immutable
// class DiscoverPage extends StatelessWidget {
//   DiscoverPage({Key? key}) : super(key: key);

//   DiscoverController controller =
//       Get.put(DiscoverController(DiscoverModel().obs));

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//      Container(
//          height: 127.h,
//          padding: EdgeInsets.only(left: 24.h,right: 24.h,bottom: 16.h),
//          decoration: BoxDecoration(
//           color: AppColor.primaryColor,
//          ),
//          child: Row(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//            Expanded(
//             child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              mainAxisSize: MainAxisSize.min,
//              children: [
//               Text('Discover',style: CustomTextStyles.headlineSmallWhiteA700,),
//               Text('USA',style: theme.textTheme.labelLarge!.copyWith(
//                color: Color(0xFFDCDCDC),
//                fontSize: 12.fSize,
//                fontWeight: FontWeight.w400,
//               ),),
//              ],
//             ),
//            ),

//            GestureDetector(
//              onTap: () {
//                 onTapSearch();

//              },
//              child: Container(
//                margin: EdgeInsets.only(right: 16.h),
//               padding: EdgeInsets.all(8.h),
//               height: 40.h,width: 40.h, decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: AppColor.whiteLight,

//              ),
//               child: CustomImageView(
//                imagePath: ImageConstant.searchIc,
//                height: 24.h,
//               ),
//              ),
//            ),
//            GestureDetector(
//              onTap: () {
//                 onTapFilter();
//              },
//              child: Container(
//               padding: EdgeInsets.all(8.h),
//               height: 40.h,width: 40.h, decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: AppColor.whiteLight,

//              ),
//               child: CustomImageView(
//                imagePath: ImageConstant.filterIc,
//                height: 24.h,
//               ),
//              ),
//            ),
//           ],
//          )
//      ),
//       Expanded(
//         child: ListView(
//           children: [
//             discoverUserList(),
//             SizedBox(height: 24.h),
//             _buildFrame(),

//             _buildColumn(),

//             // _buildFrame1(),
//             Padding(
//               padding:  EdgeInsets.symmetric(horizontal: 24.h),
//               child: Text("lbl_around_me".tr, style: theme.textTheme.titleLarge),
//             ),
//             CustomImageView(
//               margin: EdgeInsets.symmetric(vertical: 16.h,horizontal: 24.h),
//               imagePath: ImageConstant.aboutMeMap,
//               height: 267.h,
//             )

//           ],
//         ),
//       )
//     ]
//     );
//   }



//   /// Section Widget
//   Widget discoverUserList() {
//     return Align(
//         alignment: Alignment.centerRight,
//         child: SizedBox(
//             height: 126.h,
//             child: Obx(() => ListView.builder(
//                 padding: EdgeInsets.only(left: 24.h),
//                 scrollDirection: Axis.horizontal,

//                 itemCount: controller
//                     .discoverModelObj.value.userprofile2ItemList.value.length,
//                 itemBuilder: (context, index) {
//                   Userprofile2ItemModel model = controller
//                       .discoverModelObj.value.userprofile2ItemList.value[index];
//                   return Userprofile2ItemWidget(model);
//                 }))));
//   }

//   /// Section Widget
//   Widget _buildFrame() {
//     return Padding(
//         padding: EdgeInsets.only(left: 24.h, right: 38.h),
//         child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("lbl_interest".tr, style: theme.textTheme.titleLarge),
//               GestureDetector(
//                   onTap: () {
//                     onTapTxtViewAll();
//                   },
//                   child: Padding(
//                       padding: EdgeInsets.only(top: 2.v),
//                       child: Text("lbl_view_all".tr,
//                           style: CustomTextStyles.bodyLargeGray700)))
//             ]));
//   }

//   /// Section Widget
//   Widget _buildColumn() {
//     return SizedBox(
//         height: 138.h,
//         child: GridView.builder(
//           physics: NeverScrollableScrollPhysics(),
//           padding: EdgeInsets.only(left: 24.h,right: 23.h,top: 16.h,bottom: 24.h)  ,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               mainAxisExtent: 96.h,
//               crossAxisCount: 4,

//               crossAxisSpacing: 20.h),
//           itemCount:  4,
//           itemBuilder: (context, index) {
//             ColumnItemModel model =
//             controller.discoverModelObj.value.columnItemList.value[index];
//             return GestureDetector(onTap: () {
//               Get.toNamed(AppRoutes.discoverByInterestVoneScreen);
//             },
//                 child: ColumnItemWidget(model,));
//           },)

//         );
//   }




//   /// Navigates to the discoverScrollSearchClickedScreen when the action is triggered.
//   onTapSearch() {
//     Get.toNamed(
//       AppRoutes.discoverScrollSearchClickedScreen,
//     );
//   }

//   /// Navigates to the discoverFilterScreen when the action is triggered.
//   onTapFilter() {
//     Get.toNamed(
//       AppRoutes.discoverFilterScreen,
//     );
//   }

//   /// Navigates to the interestScrollSearchClickedScreen when the action is triggered.
//   onTapTxtViewAll() {
//     Get.toNamed(
//       AppRoutes.interestScrollSearchClickedScreen,
//     );
//   }
// }
