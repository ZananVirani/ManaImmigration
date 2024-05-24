// ignore_for_file: unused_element, unnecessary_import

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:flutter_maths_mingle_app/presentation/create_account_upload_photo_screen/controller/create_account_upload_photo_controller.dart';
import 'package:flutter_maths_mingle_app/presentation/profile_page/widget/profile_ope.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'controller/profile_controller.dart';
import 'models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  ProfileController controller = Get.put(ProfileController(ProfileModel().obs));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PrefData.getAppBar(
            onTap: () => Get.back(),
            leadingIcon: Icon(Icons.close_rounded),
            text: ''),
        body: ListView(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32.h),
                child: Row(children: [
                  GetBuilder<CreateAccountUploadPhotoController>(
                    init: CreateAccountUploadPhotoController(),
                    builder: (uploadPhotoController) {
                    return Container(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.only(right: 12.h),
                      height: 80.h,
                      width: 80.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: uploadPhotoController.pickedImagePath == null?CustomImageView(
                          imagePath: ImageConstant.imgEllipse225,
                          height: 80.adaptSize,
                          width: 80.adaptSize,
                          radius: BorderRadius.circular(40.h)):Image.file(
                        File(uploadPhotoController.pickedImagePath!.path),

                        fit: BoxFit.cover,
                      ),
                    );
                  },),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("lbl_john_abram2".tr,
                              style: theme.textTheme.titleMedium!.copyWith(
                                color: AppColor.black,
                              )),
                          SizedBox(height: 4.h),
                          Text("lbl_usa".tr, style: theme.textTheme.bodyMedium)
                        ]),
                  ),
                  _buildEdit()
                ]),
              ),
              _buildProfileStatus(),
              ProfileOpe(
                onTap: () {
                  Get.toNamed(AppRoutes.myAccountScreen);
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: ProfileOpe(
                  onTap: () {
                    Get.toNamed(AppRoutes.languageScreen);
                  },
                  opIcon: ImageConstant.languageIc,
                  optionName: 'Launguage',
                ),
              ),
              ProfileOpe(
                onTap: () {
                  Get.toNamed(AppRoutes.notificationsScreen);
                },
                opIcon: ImageConstant.notificationIc,
                optionName: 'Notifications',
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: ProfileOpe(
                  onTap: () {
                    Get.toNamed(AppRoutes.settingsScreen);
                  },
                  opIcon: ImageConstant.settingIc,
                  optionName: 'Settings',
                ),
              ),
              _buildUpgrade1()
            ]));
  }

  /// Section Widget
  Widget _buildEdit() {
    return CustomElevatedButton(
        height: 32.v,
        width: 76.h,
        text: "lbl_edit".tr,
        margin: EdgeInsets.symmetric(vertical: 24.v),
        buttonTextStyle: CustomTextStyles.bodyMediumWhiteA700,
        onPressed: () {
          onTapEdit();
        });
  }

  /// Section Widget
  Widget _buildFrame() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32.h),
      child: Row(children: [
        Container(
          margin: EdgeInsets.only(right: 12.h),
          height: 80.h,
          width: 80.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: CustomImageView(
              imagePath: ImageConstant.imgEllipse225,
              height: 80.adaptSize,
              width: 80.adaptSize,
              radius: BorderRadius.circular(40.h)),
        ),
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("lbl_john_abram2".tr,
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: AppColor.black,
                    )),
                SizedBox(height: 4.h),
                Text("lbl_usa".tr, style: theme.textTheme.bodyMedium)
              ]),
        ),
        _buildEdit()
      ]),
    );
  }

  /// Section Widget
  Widget _buildProfileStatus() {
    return Container(
        padding: EdgeInsets.all(16.h),
        margin: EdgeInsets.only(bottom: 32.h),
        decoration: AppDecoration.fillGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          CircularPercentIndicator(
            radius: 23.h,
            lineWidth: 3.h,
            percent: 0.5,
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: AppColor.primaryColor,
            animation: true,
            backgroundColor: AppColor.black20,
            center: Text(
              '50%',
              style: theme.textTheme.labelLarge!.copyWith(
                color: AppColor.black,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 12.h),
              child: Text("msg_complete_your_profile".tr,
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: AppColor.black40)),
            ),
          )
        ]));
  }

  /// Section Widget
  Widget _buildUpgrade() {
    return CustomElevatedButton(
        height: 30.h,
        width: 71.h,
        text: "lbl_upgrade".tr,
        margin: EdgeInsets.symmetric(vertical: 9.v),
        buttonStyle: CustomButtonStyles.fillWhiteA,
        buttonTextStyle: CustomTextStyles.bodySmallPrimary);
  }

  /// Section Widget
  Widget _buildUpgrade1() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.v),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
        child: Row(children: [
          CustomImageView(
            imagePath: ImageConstant.upgradeIc,
            height: 48.h,
            width: 48.h,
          ),
          Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 12.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("msg_get_more_matches".tr,
                          style: CustomTextStyles.titleMediumWhiteA70017),
                      SizedBox(height: 6.v),
                      Text("msg_be_seen_by_more".tr,
                          style: CustomTextStyles.bodySmallWhiteA700)
                    ])),
          ),
          _buildUpgrade()
        ]));
  }

  /// Navigates to the previous screen.
  onTapClose() {
    Get.back();
  }

  /// Navigates to the editProfileScreen when the action is triggered.
  onTapEdit() {
    Get.toNamed(
      AppRoutes.editProfileScreen,
    );
  }

  /// Navigates to the myAccountScreen when the action is triggered.
  onTapLock() {
    Get.toNamed(
      AppRoutes.myAccountScreen,
    );
  }
}
