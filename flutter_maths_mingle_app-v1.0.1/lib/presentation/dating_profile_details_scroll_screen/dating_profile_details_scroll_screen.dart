// ignore_for_file: unused_import, must_be_immutable

import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';

import '../dating_profile_details_scroll_screen/widgets/genderlist_item_widget.dart';
import '../dating_profile_details_scroll_screen/widgets/listcolumn_item_widget.dart';
import '../discover_page/controller/discover_controller.dart';
import '../discover_page/models/column_item_model.dart';
import '../discover_page/models/discover_model.dart';
import '../discover_page/widgets/column_item_widget.dart';
import 'controller/dating_profile_details_scroll_controller.dart';
import 'models/genderlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

class DatingProfileDetailsScrollScreen
    extends GetWidget<DatingProfileDetailsScrollController> {
   DatingProfileDetailsScrollScreen({Key? key}) : super(key: key);

  DiscoverController discoverController =
  Get.put(DiscoverController(DiscoverModel().obs));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PrefData.getAppBar(onTap: () => Get.back(),text: 'About'),
        body: ListView(
          padding: EdgeInsets.only(top: 16.h,left: 24.h,right: 24.h),
            children: [

              Text("lbl_about".tr,
                  style: theme.textTheme.titleMedium),
              SizedBox(height: 9.v),
              Text("msg_a_good_listener".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium!
                      .copyWith(height: 1.40)),
              SizedBox(height: 24.v),
              Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: Text("lbl_interest".tr,
                      style: theme.textTheme.titleMedium)),
             _buildColumn(),
              _buildGenderList(),

              Padding(
                padding:  EdgeInsets.only(bottom: 16.h),
                child: Text("lbl_alfredo_s_info".tr,
                    style: theme.textTheme.titleMedium),
              ),
              _buildColumnHeight()
            ]),
        bottomNavigationBar:Container(
           padding: EdgeInsets.only(top: 16,bottom: 24.h,left: 47.h,right: 47.h),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x19959595),
                blurRadius: 18,
                offset: Offset(-4, -5),
                spreadRadius: 0,
              )
            ]
          ),
          child: _buildRowUser(),
        )
    );
  }

  Widget _buildColumn() {
    return SizedBox(
        height: 137.h,
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 16.h,)  ,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 96.h,
              crossAxisCount: 4,

              crossAxisSpacing: 20.h),
          itemCount:  4,
          itemBuilder: (context, index) {
            ColumnItemModel model =
            discoverController.discoverModelObj.value.columnItemList.value[index];
            return GestureDetector(onTap: () {
              // Get.toNamed(AppRoutes.discoverByInterestVoneScreen);
            },
                child: ColumnItemWidget(model,));
          },)

    );
  }


  /// Section Widget
  Widget _buildGenderList() {
    return SizedBox(
        height: 166.h,
        child: Obx(() => GridView.builder(
          padding: EdgeInsets.only(top: 16.h,bottom: 24.h)  ,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 118.h,
                crossAxisCount: 3,

                crossAxisSpacing: 20.h),
            itemCount: controller.datingProfileDetailsScrollModelObj.value
                .genderlistItemList.value.length,
            itemBuilder: (context, index) {
              GenderlistItemModel model = controller
                  .datingProfileDetailsScrollModelObj
                  .value
                  .genderlistItemList
                  .value[index];
              return GenderlistItemWidget(model);
            })));
  }

  /// Section Widget
  Widget _buildColumnHeight() {
    return Container(

        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.v),
        decoration: AppDecoration.outlineErrorContainer
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8,boxShadow: [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 16.h,
            spreadRadius: 0,
          )
        ]),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 4.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 1.v),
                            child: Text("lbl_height".tr,
                                style: theme.textTheme.bodyMedium)),
                        Text("lbl_120_cm".tr, style: theme.textTheme.titleSmall)
                      ])),
              SizedBox(height: 15.v),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("lbl_speak".tr, style: theme.textTheme.bodyMedium),
                Text("msg_urbanic_indonesia".tr,
                    style: theme.textTheme.titleSmall)
              ]),
              SizedBox(height: 16.v),
              _buildRowFrame(
                  starSign: "lbl_relationship".tr, arbi: "lbl_single".tr),
              SizedBox(height: 14.v),
              _buildRowFrame(starSign: "lbl_star_sign".tr, arbi: "lbl_arbi".tr)
            ]));
  }

  /// Section Widget
  Widget _buildRowUser() {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      CustomImageView(
          imagePath: ImageConstant.imgUser32x51, height: 32.v, width: 51.h),
      Padding(
          padding: EdgeInsets.only(left: 11.h, top: 9.v, bottom: 5.v),
          child: Text("msg_you_alfredo_have".tr,
              style: CustomTextStyles.bodySmallErrorContainer))
    ]);
  }

  /// Common widget
  Widget _buildRowFrame({
    required String starSign,
    required String arbi,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(starSign,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: appTheme.gray700))),
      Text(arbi,
          style: theme.textTheme.titleSmall!
              .copyWith(color: theme.colorScheme.errorContainer.withOpacity(1)))
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
