// ignore_for_file: must_be_immutable

import 'dart:io';

// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';

import '../create_account_upload_photo_screen/controller/create_account_upload_photo_controller.dart';
import '../discover_page/controller/discover_controller.dart';
import '../discover_page/models/column_item_model.dart';
import '../discover_page/models/discover_model.dart';
import '../discover_page/widgets/column_item_widget.dart';
import 'controller/my_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';


class MyAccountScreen extends GetWidget<MyAccountController> {
   MyAccountScreen({Key? key}) : super(key: key);

  MyAccountController controller = Get.put(MyAccountController());

  @override
  Widget build(BuildContext context) {

    controller.nameEditTextController.text = 'John abram';
    controller.dateOfBirthEditTextController.text = '04/2/1995';
    controller.descriptionEditTextController.text = 'Making it look like readable English. Many desktop publishing packages';
    controller.countryEditTextController.text='USA';
    controller.genderEditTextController.text='Man';

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PrefData.getAppBar(onTap: () => Get.back(),text: 'My Account'),
        body: ListView(
          padding: EdgeInsets.only(left: 24.h,right: 24.h,top: 16.h),
            children: [

          Padding(
              padding: EdgeInsets.only(left: 1.h),
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
                Padding(
                    padding: EdgeInsets.only(
                        left: 12.h,
                        top: 14.v,
                        bottom: 14.v),
                    child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text("lbl_john_abram2".tr,
                              style: theme.textTheme
                                  .titleMedium),
                          SizedBox(height: 5.v),
                          Text("lbl_usa".tr,
                              style: theme.textTheme
                                  .bodyMedium)
                        ]))
              ])),

          Padding(
              padding: EdgeInsets.only(top: 24.h,bottom: 16.h),
              child: Text("msg_personal_details".tr,
                  style:
                  theme.textTheme.titleMedium!.copyWith(
                    color: AppColor.black,
                    fontSize: 18.fSize,
                  ))),
          Container(
            padding: EdgeInsets.all(16.h),
            decoration: BoxDecoration(
              color: AppColor.lightGray,
              borderRadius: BorderRadius.circular(8.h),
            ),
            child: Text(controller.nameEditTextController.text, style:
            theme.textTheme.titleMedium!.copyWith(
              color: AppColor.black,
              fontSize: 17.fSize,
              fontWeight: FontWeight.w400,

            ) ,),
          ),
          Container(
            padding: EdgeInsets.all(16.h),
            margin: EdgeInsets.symmetric(vertical: 24.h),
            decoration: BoxDecoration(
              color: AppColor.lightGray,
              borderRadius: BorderRadius.circular(8.h),
            ),
            child: Text(controller.dateOfBirthEditTextController.text, style:
            theme.textTheme.titleMedium!.copyWith(
              color: AppColor.black,
              fontSize: 17.fSize,
              fontWeight: FontWeight.w400,

            ) ,),
          ),
          Container(
            padding: EdgeInsets.only(top: 16.h,left: 16.h,right: 16.h,bottom: 39.h),
            decoration: BoxDecoration(
              color: AppColor.lightGray,
              borderRadius: BorderRadius.circular(8.h),
            ),
            child: Text(controller.descriptionEditTextController.text, style:
            theme.textTheme.titleMedium!.copyWith(
              color: AppColor.black,
              fontSize: 17.fSize,
              fontWeight: FontWeight.w400,

            ) ,),
          ),
          _buildInterestRow(),
          _buildColumn(),
          Container(
            margin: EdgeInsets.only(bottom: 24.h),
            padding: EdgeInsets.all(16.h),
            decoration: BoxDecoration(
              color: AppColor.lightGray,
              borderRadius: BorderRadius.circular(8.h),
            ),
            child: Text(controller.countryEditTextController.text, style:
            theme.textTheme.titleMedium!.copyWith(
              color: AppColor.black,
              fontSize: 17.fSize,
              fontWeight: FontWeight.w400,

            ) ,),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 24.h),
            padding: EdgeInsets.all(16.h),
            decoration: BoxDecoration(
              color: AppColor.lightGray,
              borderRadius: BorderRadius.circular(8.h),
            ),
            child: Text(controller.genderEditTextController.text, style:
            theme.textTheme.titleMedium!.copyWith(
              color: AppColor.black,
              fontSize: 17.fSize,
              fontWeight: FontWeight.w400,

            ) ,),
          )
        ]),

    );
  }







  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  Widget _buildInterestRow() {
    return Padding(
      padding:  EdgeInsets.only(top: 24.h,),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("lbl_interest".tr, style: theme.textTheme.titleLarge),
        GestureDetector(onTap: () {
          Get.toNamed(AppRoutes.interestScrollSearchClickedScreen);
        },
                child: Text("lbl_edit".tr, style: CustomTextStyles.bodyLargePrimary))
      ]),
    );
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

}
