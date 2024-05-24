// ignore_for_file: unused_import, must_be_immutable

import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../data/list_data/app_listdata.dart';
import '../create_account_select_interest_screen/widget/int_ope.dart';
import 'controller/discover_filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_drop_down.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_elevated_button.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_outlined_button.dart';

class DiscoverFilterScreen extends GetWidget<DiscoverFilterController> {
  DiscoverFilterScreen({Key? key}) : super(key: key);

  double _value = 5.5;
  bool status = false;
  DiscoverFilterController controller = Get.put(DiscoverFilterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PrefData.getAppBar(onTap: () => Get.back(), text: 'Filters'),
        body: ListView(
            padding: EdgeInsets.only( top: 24.h),
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.h),
                child: CustomDropDown(

                    icon: CustomImageView(
                        imagePath: ImageConstant.arrowDownIc,
                        height: 24.adaptSize,
                        width: 24.adaptSize),
                    hintText: "Select place ".tr,
                    items: controller
                        .discoverFilterModelObj.value.dropdownItemList.value,
                    onChanged: (value) {
                      controller.onSelected(value);
                    }),
              ),

              Padding(
                padding: EdgeInsets.only(top: 24.h, bottom: 16.h,left: 24.h,right: 24.h),
                child: Text("lbl_preferences".tr,
                    style: theme.textTheme.titleLarge),
              ),

              _buildPreferences(),

              _buildAge(),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.h),
                child: CustomDropDown(
                    icon: CustomImageView(
                        imagePath: ImageConstant.arrowDownIc,
                        height: 24.adaptSize,
                        width: 24.adaptSize),
                    hintText: "lbl_select_age".tr,
                    items: controller
                        .discoverFilterModelObj.value.dropdownItemList1.value,
                    onChanged: (value) {
                      controller.onSelected1(value);
                    },),
              ),

              _buildDistance(),

              GetBuilder<DiscoverFilterController>(
                init: DiscoverFilterController(),
                builder: (controllers) {
                  return SfSlider(
                    min: 0.5,
                    max: 50.0,
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
                      print('value cghanges --$value---$_value');
                    },

                    // onChanged: (dynamic value){
                    //   value = controller.distanceValue;
                    //   controller.update();
                    // },
                  );
                },
              ),

              SizedBox(height: 24.h),
              // _buildInputDefault(),
            ]),
        bottomNavigationBar: _buildReset());
  }

  /// Section Widget
  Widget _buildPreferences() {
    return GetBuilder<DiscoverFilterController>(
      builder: (controller) {
        return SizedBox(
          height: 24.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 24.h),

            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: AppListData.userPreference.length,

            separatorBuilder: (context, index) {
              return SizedBox(width: 16.h);
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.sizeIndex.value = index;
                  controller.productPressed.value = !controller.productPressed.value;
                  controller.update();
                },
                child: InterestOpe(
                  opValue: controller.sizeIndex.value == index,
                  valueText: AppListData.userPreference[index].inrerestName,

                ),
              );
            },

          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildAge() {
    return Padding(
      padding: EdgeInsets.only(top: 24.h, bottom: 16.h,left: 24.h,right: 24.h),
      child: Row(children: [
        Expanded(child: Text("lbl_age".tr, style: theme.textTheme.titleLarge)),
        Text("lbl_20_25".tr, style: CustomTextStyles.bodyLargePrimary)
      ]),
    );
  }

  /// Section Widget
  Widget _buildDistance() {
    return Padding(
        padding: EdgeInsets.only(right: 32.h, top: 24.h, bottom: 16.h,left: 24.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("lbl_distance".tr, style: theme.textTheme.titleLarge),
         GetBuilder<DiscoverFilterController>(
           init: DiscoverFilterController(),
           builder: (controller) {
            return Text(
              "${controller.distanceValue.toInt()} KM",
              style: CustomTextStyles.bodyLargePrimary,
            );

         },)
        ]));
  }



  /// Section Widget
  Widget _buildReset() {
    return Container(
        margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 24.v),
        decoration: AppDecoration.white,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: CustomOutlinedButton(onPressed: () {
                controller.status = false;
                controller.distanceValue = 30.0;
                controller.sizeIndex.value = 0;
                controller.productPressed.value = false;
                controller.update();

              },text: "lbl_reset".tr,)),
              SizedBox(
                width: 20.h,
              ),
              Expanded(
                child: CustomElevatedButton(
                  onPressed: () {
                    Get.back();

                  },
                  text: "lbl_apply".tr,
                ),
              )
            ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
