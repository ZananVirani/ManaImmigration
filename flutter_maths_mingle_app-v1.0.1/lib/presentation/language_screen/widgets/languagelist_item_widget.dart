import 'package:flutter/cupertino.dart';

import '../controller/language_controller.dart';
import '../models/languagelist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

// ignore: must_be_immutable
class LanguagelistItemWidget extends StatelessWidget {

  final bool isSelected;
  LanguagelistItemWidget(
    this.languagelistItemModelObj, {
    Key? key, required this.isSelected,
  }) : super(
          key: key,
        );

  LanguagelistItemModel languagelistItemModelObj;

  var controller = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.outlineErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
        boxShadow: [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 16.h,
            
            spreadRadius: 0,
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
              imagePath: languagelistItemModelObj.englishImage!.value,
              height: 30.h,
              width: 41.h,
            ),


          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 22.h,
             
              ),
              child: Obx(
                () => Text(
                  languagelistItemModelObj.englishText!.value,
                  style: CustomTextStyles.bodyLargePoppinsOnPrimary,
                ),
              ),
            ),
          ),
      
          // Obx(
          //   () => CustomImageView(
          //     imagePath: languagelistItemModelObj.checkmarkImage!.value,
          //     height: 24.adaptSize,
          //     width: 24.adaptSize,
          //     margin: EdgeInsets.symmetric(vertical: 3.v),
          //   ),
          // ),

          CustomImageView(
            imagePath: isSelected?ImageConstant.SelectFlgIc:ImageConstant.UnselectFlgIc,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),


        ],
      ),
    );
  }
}
