// ignore_for_file: must_be_immutable, unnecessary_import

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:intl/intl.dart';

import '../create_account_upload_photo_screen/controller/create_account_upload_photo_controller.dart';
import '../discover_page/controller/discover_controller.dart';
import '../discover_page/models/column_item_model.dart';
import '../discover_page/models/discover_model.dart';
import '../discover_page/widgets/column_item_widget.dart';
import 'controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_elevated_button.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_text_form_field.dart';

class EditProfileScreen extends GetWidget<EditProfileController> {
   EditProfileScreen({Key? key}) : super(key: key);


  EditProfileController controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    controller.nameEditTextController.text = 'John abram';
    controller.dateOfBirthEditTextController.text = '04/2/1995';
    controller.descriptionEditTextController.text = 'Making it look like readable English. Many desktop publishing packages';
    controller.countryEditTextController.text='USA';
    controller.genderEditTextController.text='Man';

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: PrefData.getAppBar(onTap: () => Get.back(),text: 'Edit profile'),
        body: ListView(
          padding: EdgeInsets.only(top: 16.h,left: 24.h,right: 24.h),
            children: [
              // CustomImageView(
              //     imagePath: ImageConstant.profileBg,
              //     height: 327.adaptSize,
              //     radius: BorderRadius.circular(8.h),
              //   margin: EdgeInsets.only(bottom: 24.h),
              //    ),
              //
              // buildAddImage(),
              GetBuilder<CreateAccountUploadPhotoController>(
                init: CreateAccountUploadPhotoController(),
                builder: (uploadPhotoController) {
                return GestureDetector(
                  onTap: () {
                    uploadPhotoController.getImage();
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.only(bottom: 24.h),
                    height: 327.h,
                    decoration: BoxDecoration(
                        color: AppColor.lightGray,
                        borderRadius: BorderRadius.circular(8.h)),
                    child: uploadPhotoController.pickedImagePath == null
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
                      File(uploadPhotoController.pickedImagePath!.path),
                      height: 327.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },),
              GetBuilder<CreateAccountUploadPhotoController>(
                init: CreateAccountUploadPhotoController(),
                builder: (uploadPhotoController) {
                return GridView.builder(
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
                              child: uploadPhotoController.pickedSecondPic == null
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
                                File(uploadPhotoController.pickedSecondPic!.path),

                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        });
                  },
                );
              },),

              Padding(
                  padding: EdgeInsets.only(top: 24.h,bottom: 16.h),
                  child: Text("msg_personal_details".tr,
                      style:
                          theme.textTheme.titleMedium!.copyWith(
                            color: AppColor.black,
                            fontSize: 18.fSize,
                          ))),

              buildNameTextField(),
              buildBirthdate(context),
              buildDiscription(),
              _buildInterestRow(),
              _buildColumn(),
              _buildCountryEditText(),
              SizedBox(height: 24.h),
              _buildGenderEditText(),
              _buildSave(),
            ]),
    );
  }

  CustomTextFormField buildDiscription() {
    return CustomTextFormField(
      autofocus: false,
              controller: controller.descriptionEditTextController,
              hintText: "Enter description".tr,
              maxLines: 3,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.h, vertical: 19.h));
  }

  Padding buildBirthdate(BuildContext context) {
    return Padding(
              padding:  EdgeInsets.symmetric(vertical: 24.h),
              child: GestureDetector(
                onTap: () async {

                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                    DateFormat('dd/MM/yyyy').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16

                      controller.dateOfBirthEditTextController.text =
                          formattedDate; //set output date to TextField value.

                  } else {}
                },
                child: CustomTextFormField(
                  enable: false,
                    controller: controller.dateOfBirthEditTextController,
                    hintText: "lbl_04_2_2025".tr),
              ),
            );
  }

  CustomTextFormField buildNameTextField() {
    return CustomTextFormField(
                controller: controller.nameEditTextController,
                autofocus: false,
                hintText: "Enter Name".tr);
  }

  GridView buildAddImage() {
    return GridView.builder(
              shrinkWrap: true,

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

                      return Container(
                        decoration: BoxDecoration(
                          color: AppColor.lightGray,
                          borderRadius: BorderRadius.circular(8.h),

                        ),
                        child: Column(
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
                              child: Icon(Icons.add,size: 24.h,color: AppColor.black,),
                            ),
                            Text(
                                'Add',
                                textAlign: TextAlign.center,
                                style: CustomTextStyles.bodyLargeff000000
                            ),
                          ],
                        ),
                      );
                    });
              },
            );
  }

  /// Section Widget
  Widget _buildInterestRow() {
    return Padding(
      padding:  EdgeInsets.only(top: 24.h,),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("lbl_interest".tr, style: theme.textTheme.titleLarge),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.interestScrollSearchClickedScreen);
                  },
                child: Text("lbl_edit".tr, style: CustomTextStyles.bodyLargePrimary))
              ]),
    );
  }

  /// Section Widget
  Widget _buildCountryEditText() {
    return CustomTextFormField(
      autofocus: false,
        controller: controller.countryEditTextController,
        hintText: "Enter Country".tr);
  }

  /// Section Widget
  Widget _buildGenderEditText() {
    return CustomTextFormField(
      autofocus: false,
        controller: controller.genderEditTextController,
        hintText: "Enter Gender".tr,

        textInputAction: TextInputAction.done);
  }

  /// Section Widget
  Widget _buildSaveButton() {
    return CustomElevatedButton(
      onPressed: () {
        Get.back();
      },
        text: "lbl_save".tr,
      margin: EdgeInsets.only(top: 40.h,bottom: 24.h),
    );
  }

  /// Section Widget
  Widget _buildSave() {
    return _buildSaveButton();
  }

   Widget _buildColumn() {
     return GetBuilder<DiscoverController>(
       init: DiscoverController(DiscoverModel().obs),

       builder: (controllers) {
       return SizedBox(
         // color: Colors.red,
           height: 137.h,
           child: GridView.builder(
             physics: NeverScrollableScrollPhysics(),
             padding: EdgeInsets.only(top: 16.h,bottom: 24.h),
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 mainAxisExtent: 96.h,
                 crossAxisCount: 4,

                 crossAxisSpacing: 20.h),
             itemCount:  4,
             itemBuilder: (context, index) {
               ColumnItemModel model =
               controllers.discoverModelObj.value.columnItemList.value[index];
               return GestureDetector(onTap: () {
                 Get.toNamed(AppRoutes.discoverByInterestVoneScreen);
               },
                   child: ColumnItemWidget(model,));
             },)

       );
     },);
   }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
