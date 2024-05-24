// ignore_for_file: must_be_immutable, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:flutter_maths_mingle_app/presentation/dating_profile_details_scroll_screen/controller/dating_profile_details_scroll_controller.dart';

import '../dating_profile_details_scroll_screen/models/genderlist_item_model.dart';
import '../dating_profile_details_scroll_screen/widgets/genderlist_item_widget.dart';
import '../discover_page/controller/discover_controller.dart';
import '../discover_page/models/column_item_model.dart';
import '../discover_page/models/discover_model.dart';
import '../discover_page/widgets/column_item_widget.dart';
import 'controller/dating_profile_details_vone_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

class DatingProfileDetailsVoneScreen
    extends GetWidget<DatingProfileDetailsVoneController> {
  DatingProfileDetailsVoneScreen({Key? key}) : super(key: key);

  DiscoverController discoverController =
      Get.put(DiscoverController(DiscoverModel().obs));

  String detailsImg = Get.arguments[0];
  String detailsPersonName = Get.arguments[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrefData.getAppBar(onTap: () => Get.back(), text: ''),
      body: ListView(
          padding: EdgeInsets.only(top: 16.h, left: 24.h, right: 24.h),
          children: [
            Container(
                padding: EdgeInsets.all(16.h),
                decoration: AppDecoration.outlineErrorContainer.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder8,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x11000000),
                        blurRadius: 16.h,
                        spreadRadius: 0,
                      )
                    ]),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(alignment: Alignment.center, children: [
                        CustomImageView(
                            imagePath: detailsImg,
                            height: 299.adaptSize,
                            width: double.infinity,


                            radius: BorderRadius.circular(8.h),
                            alignment: Alignment.center),
                        Container(

                            height: 299.adaptSize,

                            decoration: AppDecoration
                                .gradientErrorContainerToErrorContainer3
                                .copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder8),
                            ),
                        Positioned(
                          top: 8.h,
                          right: 8.h,
                          child: SizedBox(
                              height: 48.adaptSize,
                              width: 48.adaptSize,
                              child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Align(
                                        alignment:
                                        Alignment.center,
                                        child: SizedBox(
                                            height:
                                            48.adaptSize,
                                            width: 48.adaptSize,
                                            child:
                                            CircularProgressIndicator(
                                                value: 0.5,
                                                backgroundColor: AppColor.white,
                                                strokeCap: StrokeCap.round,
                                                strokeWidth:
                                                3.h))),
                                    Align(
                                        alignment:
                                        Alignment.center,
                                        child: Text("lbl_50".tr,
                                            style: theme
                                                .textTheme
                                                .labelLarge))
                                  ])),
                        ),
                        Positioned(
                          bottom: 8.h,left: 8.h,
                          child: Text("lbl_2_5_km_away".tr,
                              style: CustomTextStyles
                                  .bodyLargeWhiteA700),
                        ),
                      ]),
                      SizedBox(height: 8.h),
                      Text(detailsPersonName,
                          style: CustomTextStyles.titleMedium17),
                      SizedBox(height: 4.h),
                      Text("lbl_america_usa".tr,
                          style: theme.textTheme.bodyMedium),
                      Padding(
                        padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
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
                            Container(
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
                                imagePath: ImageConstant.starWhiteIc,
                                margin: EdgeInsets.all(16.h),
                              ),
                            ),
                            Container(
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
                                imagePath: ImageConstant.heartIc,
                                margin: EdgeInsets.all(16.h),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ])),
            Padding(
              padding: EdgeInsets.only(top: 24.h, bottom: 8.h),
              child: Text("lbl_about".tr, style: theme.textTheme.titleMedium),
            ),
            Text("msg_a_good_listener".tr,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium!.copyWith(height: 1.40)),
            SizedBox(height: 24.v),
            Text("lbl_interest".tr, style: theme.textTheme.titleMedium),
            _buildColumn(),
            _buildGenderList(),
            Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Text("lbl_alfredo_s_info".tr,
                  style: theme.textTheme.titleMedium),
            ),
            _buildColumnHeight()
          ]),
      bottomNavigationBar: Container(
        padding:
            EdgeInsets.only(top: 16, bottom: 24.h, left: 47.h, right: 47.h),
        width: double.infinity,
        decoration: BoxDecoration(color: AppColor.white, boxShadow: [
          BoxShadow(
            color: Color(0x19959595),
            blurRadius: 18,
            offset: Offset(-4, -5),
            spreadRadius: 0,
          )
        ]),
        child: _buildRowUser(),
      ),
    );
  }

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

  Widget _buildGenderList() {
    return GetBuilder<DatingProfileDetailsScrollController>(
      init: DatingProfileDetailsScrollController(),
      builder: (controllers) {
        return SizedBox(
            height: 166.h,
            child: Obx(() => GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 118.h,
                    crossAxisCount: 3,
                    crossAxisSpacing: 20.h),
                itemCount: controllers.datingProfileDetailsScrollModelObj.value
                    .genderlistItemList.value.length,
                itemBuilder: (context, index) {
                  GenderlistItemModel model = controllers
                      .datingProfileDetailsScrollModelObj
                      .value
                      .genderlistItemList
                      .value[index];
                  return GenderlistItemWidget(model);
                })));
      },
    );
  }

  Widget _buildColumnHeight() {
    return GetBuilder<DatingProfileDetailsScrollController>(
      init: DatingProfileDetailsScrollController(),
      builder: (controllers) {
        return Container(
            margin: EdgeInsets.only(bottom: 50.h),
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.v),
            decoration: AppDecoration.outlineErrorContainer.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder8,
                boxShadow: [
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
                            Text("lbl_120_cm".tr,
                                style: theme.textTheme.titleSmall)
                          ])),
                  SizedBox(height: 15.v),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("lbl_speak".tr, style: theme.textTheme.bodyMedium),
                        Text("msg_urbanic_indonesia".tr,
                            style: theme.textTheme.titleSmall)
                      ]),
                  SizedBox(height: 16.h),
                  _buildRowFrame(
                      starSign: "lbl_relationship".tr, arbi: "lbl_single".tr),
                  SizedBox(height: 14.h),
                  _buildRowFrame(
                      starSign: "lbl_star_sign".tr, arbi: "lbl_arbi".tr)
                ]));
      },
    );
  }

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

  Widget _buildColumn() {
    return SizedBox(
        height: 112.h,
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(
            top: 16.h,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 96.h, crossAxisCount: 4, crossAxisSpacing: 20.h),
          itemCount: 4,
          itemBuilder: (context, index) {
            ColumnItemModel model = discoverController
                .discoverModelObj.value.columnItemList.value[index];
            return GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.discoverByInterestVoneScreen);
              },
              child: ColumnItemWidget(
                model,
              ),
            );
          },
        ));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the datingProfileDetailsVthreeScreen when the action is triggered.
  onTapBtnIconButton() {
    Get.toNamed(
      AppRoutes.datingProfileDetailsVthreeScreen,
    );
  }

  /// Navigates to the datingProfileDetailsVtwoScreen when the action is triggered.
  onTapBtnFavorite() {
    Get.toNamed(
      AppRoutes.datingProfileDetailsVtwoScreen,
    );
  }
}
