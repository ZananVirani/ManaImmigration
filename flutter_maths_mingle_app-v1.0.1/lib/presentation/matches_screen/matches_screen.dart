// ignore_for_file: must_be_immutable, unused_element

import 'package:flutter/services.dart';
import 'package:flutter_maths_mingle_app/data/list_data/app_listdata.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';

import '../../widgets/custom_outlined_button.dart';
import '../matches_screen/widgets/userprofile3_item_widget.dart';
import 'controller/matches_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

import 'package:flutter_maths_mingle_app/widgets/custom_elevated_button.dart';

class MatchesScreen extends GetWidget<MatchesController> {
   MatchesScreen({Key? key}) : super(key: key);

  MatchesController controller = Get.put(MatchesController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: buildAppBar(),
        body: ListView(
          padding: EdgeInsets.only(left: 24.h,right: 24.h),
            children: [

              _buildSelectPlan(),

              Padding(
                padding:  EdgeInsets.only(bottom: 16.h),
                child: Text("lbl_your_matches".tr,
                    style: theme.textTheme.titleLarge),
              ),
              _buildUserProfile()
            ]),

    );
    // :buildIsMatched();
  }



  AppBar buildAppBar() {
    return AppBar(
        title: Padding(
          padding:  EdgeInsets.only(left: 8.h),
          child: Text(
            'Matches',
            style:  theme.textTheme.titleLarge!.copyWith(
              color: AppColor.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        surfaceTintColor: AppColor.white,
      shadowColor: Color(0x34D3CCCC),
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,


        ),
        leadingWidth: 50.h,
        centerTitle: false,
        toolbarHeight: 70.h,
        elevation:10.h,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor:  Colors.white,

      );
  }

   Scaffold buildIsMatched() {
     return Scaffold(
         appBar: PrefData.getAppBar(onTap: () => Get.back(),text: ''),
         body: ListView(

           padding: EdgeInsets.symmetric(horizontal: 24.h),
             children: [
           // _buildFiftyStack(),
               CustomImageView(
                   imagePath: ImageConstant.imgMD1,
                    height: 356.h,

                   margin: EdgeInsets.only(bottom: 42.h,top: 32.h),
                   onTap: () {
                     onTapUserProfile();
                   }),

           RichText(
               text: TextSpan(children: [
                 TextSpan(
                     text: "lbl_you_and".tr,
                     style: CustomTextStyles.headlineSmallff000000),
                 TextSpan(
                     text: "lbl_alfredo".tr,
                     style: CustomTextStyles.headlineSmallff000000),
                 TextSpan(
                     text: "msg_liked_each_other".tr,
                     style: CustomTextStyles.headlineSmallff000000)
               ]),
               textAlign: TextAlign.center),
           SizedBox(height: 5.v),
           _buildSendAMessageColumn(),
         ]),
         // bottomNavigationBar: _buildSendAMessageColumn()
     );
   }



  /// Section Widget
  Widget _buildFrame() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child: CustomElevatedButton(
                      text: "lbl_likes_20_00".tr,
                      buttonStyle: CustomButtonStyles.fillWhiteA,
                      buttonTextStyle: theme.textTheme.bodyLarge!),
              ),
              SizedBox(
                width: 20.h,
              ),
              Expanded(
                child: CustomElevatedButton(
                      text: "lbl_connect_25_00".tr,
                      buttonStyle: CustomButtonStyles.fillWhiteA,
                      buttonTextStyle: theme.textTheme.bodyLarge!),
              )
            ]);
  }
   Widget _buildSendAMessageColumn() {
     return Column(mainAxisSize: MainAxisSize.min, children: [
       CustomElevatedButton(
           text: "lbl_send_a_message".tr,
           onPressed: () {

           }),
       CustomOutlinedButton(
           text: "lbl_keep_swiping".tr,
           margin: EdgeInsets.only(top: 16.v),
           onPressed: () {
           })
     ]);
   }


  /// Section Widget
  Widget _buildUserProfile() {

     return GetBuilder<MatchesController>(
       init: MatchesController(),
       builder: (controller) {
       return GridView.builder(
         padding: EdgeInsets.only(bottom: 50.h),
         shrinkWrap: true,
         physics: NeverScrollableScrollPhysics(),

         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             mainAxisExtent: 217.h,
             crossAxisCount: 2,
             mainAxisSpacing: 16.h,

             crossAxisSpacing: 20.h),
         itemCount:  AppListData.userMatchesList.length,
         itemBuilder: (context, index) {

           return Userprofile3ItemWidget(
             matchesName: AppListData.userMatchesList[index].username!.value,
             matchesDistance: AppListData.userMatchesList[index].distanceLabel!.value,
             matchesDescription: AppListData.userMatchesList[index].description!.value,
             matchesImage: AppListData.userMatchesList[index].distance!.value,

           );
         },);
     },);
  }

  Widget _buildSelectPlan() {

     return GetBuilder<MatchesController>(
       init: MatchesController(),
       builder: (controller) {
       return GridView.builder(
         padding: EdgeInsets.only(bottom: 24.h,top: 24.h),
         shrinkWrap: true,
         physics: NeverScrollableScrollPhysics(),

         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             mainAxisExtent: 56.h,
             crossAxisCount: 2,
             mainAxisSpacing: 16.h,

             crossAxisSpacing: 20.h),
         itemCount:  AppListData.matchesPurchaseList.length,
         itemBuilder: (context, index) {

           return Container(
             alignment: Alignment.center,
           padding: EdgeInsets.symmetric(vertical: 16.h),
             decoration: BoxDecoration(
               color: AppColor.white,
               borderRadius: BorderRadius.circular(8.h),
               boxShadow: [
                 BoxShadow(
                   color: Color(0x11000000),
                   blurRadius: 12.h,
                   offset: Offset(0, 3),
                   spreadRadius: 0,
                 )
               ]
             ),
             child: Text(AppListData.matchesPurchaseList[index].purchaseText,style: CustomTextStyles.bodyLargeff000000,),
           );
         },);
     },);
  }



  /// Navigates to the datingProfileDetailsVoneScreen when the action is triggered.
  onTapUserProfile() {
    Get.toNamed(AppRoutes.datingProfileDetailsVoneScreen);
  }

  /// Navigates to the discoverFilterScreen when the action is triggered.
  onTapUpload() {
    Get.toNamed(
      AppRoutes.discoverFilterScreen,
    );
  }
}
