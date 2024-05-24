// ignore_for_file: unnecessary_import

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';

import 'controller/create_account_upload_photo_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_elevated_button.dart';

class CreateAccountUploadPhotoScreen
    extends GetWidget<CreateAccountUploadPhotoController> {
  const CreateAccountUploadPhotoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PrefData.getAppBar(
            onTap: () => Get.back(), text: 'Upload your photos'),
        body: GetBuilder<CreateAccountUploadPhotoController>(
          init: CreateAccountUploadPhotoController(),
          builder: (controller) {
            return ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.h),
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: Container(
                        height: 8.v,
                        decoration: BoxDecoration(
                            color: appTheme.gray10002,
                            borderRadius: BorderRadius.circular(4.h)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(4.h),
                            child: LinearProgressIndicator(
                                value: 1,
                                backgroundColor: appTheme.gray10002,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    theme.colorScheme.primary)))),
                  ),
                  SizedBox(height: 8.h),
                  RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "lbl_52".tr,
                            style: CustomTextStyles.bodyLargeff696969),
                        TextSpan(
                            text: "lbl_5".tr,
                            style: CustomTextStyles.titleLargeffd97bca)
                      ]),
                      textAlign: TextAlign.left),
                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap: () {
                      controller.getImage();
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.only(bottom: 24.h),
                      height: 327.h,
                      decoration: BoxDecoration(
                          color: AppColor.lightGray,
                          borderRadius: BorderRadius.circular(8.h)),
                      child: controller.pickedImagePath == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 8.h),
                                  height: 40.h,
                                  width: 40.h,
                                  decoration: BoxDecoration(
                                    color: AppColor.black20,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    size: 24.h,
                                    color: AppColor.black,
                                  ),
                                ),
                                Text('Add image',
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyles.bodyLargeff000000),
                              ],
                            )
                          : Image.file(
                              File(controller.pickedImagePath!.path),
                              height: 327.h,
                        fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 8.h),
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 85.h,
                        crossAxisCount: 4,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 20.h),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GetBuilder<CreateAccountUploadPhotoController>(
                          init: CreateAccountUploadPhotoController(),
                          builder: (controller) {
                            return GestureDetector(
                              onTap: () {
                                controller.getSubImage();
                                controller.update();
                              },
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  color: AppColor.lightGray,
                                  borderRadius: BorderRadius.circular(8.h),
                                ),
                                child: controller.pickedSecondPic == null
                                    ?Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 8.h),
                                      height: 40.h,
                                      width: 40.h,
                                      decoration: BoxDecoration(
                                        color: AppColor.black20,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        size: 24.h,
                                        color: AppColor.black,
                                      ),
                                    ),
                                    Text('Add',
                                        textAlign: TextAlign.center,
                                        style:
                                            CustomTextStyles.bodyLargeff000000),
                                  ],
                                ):Image.file(
                                  File(controller.pickedSecondPic!.path),

                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          });
                    },
                  ),
                  SizedBox(height: 5.v)
                ]);
          },
        ),
        bottomNavigationBar: _buildNext(context));
  }

  /// Section Widget
  Widget _buildNext(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 24.h),
        decoration: AppDecoration.white,
        child: CustomElevatedButton(
            text: "lbl_next".tr,
            onPressed: () {
              onTapNext(context);
            }));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Displays a dialog with the [CreateAccountUploadPhoto1Dialog] content.
  onTapNext(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 24.h),
              clipBehavior: Clip.none,
              scrollable: true,
              content: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.h),
                child: Column(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.successIc,
                      height: 100.h,
                      width: 100.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
                      child: Text('You’re verified!',
                          style: CustomTextStyles.headlineSmallff000000),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 24.h, right: 24.h, bottom: 16.h),
                      child: Text(
                        'Your account is verified, let’s start make friends!',
                        style: CustomTextStyles.bodyLargeff696969,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              actions: [
                CustomElevatedButton(
                    text: "Get started".tr,
                    onPressed: () {
                      PrefData.setLogin(false);
                      Get.toNamed(AppRoutes.bottomBarScreen);
                    })
              ],
              backgroundColor: AppColor.white,
              surfaceTintColor: Colors.white,
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.h))),
            ));
  }
}
