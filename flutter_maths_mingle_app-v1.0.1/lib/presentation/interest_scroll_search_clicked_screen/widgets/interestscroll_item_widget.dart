import '../controller/interest_scroll_search_clicked_controller.dart';
import '../models/interestscroll_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

// ignore: must_be_immutable
class InterestscrollItemWidget extends StatelessWidget {
  InterestscrollItemWidget(
    this.interestscrollItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  InterestscrollItemModel interestscrollItemModelObj;

  var controller = Get.find<InterestScrollSearchClickedController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 97.adaptSize,
          width: 97.adaptSize,
          padding: EdgeInsets.all(28.h),
          decoration: AppDecoration.outlineErrorContainer.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder48,
            boxShadow: [
              BoxShadow(
                color: Color(0x11000000),
                blurRadius: 16,

                spreadRadius: 0,
              )
            ]
          ),
          child: Obx(
            () => CustomImageView(
              imagePath: interestscrollItemModelObj.footballImage!.value,
              height: 40.adaptSize,
              width: 40.adaptSize,
              alignment: Alignment.center,
            ),
          ),
        ),
        SizedBox(height: 6.h),
        Obx(
          () => Text(
            interestscrollItemModelObj.footballText!.value,
            style: CustomTextStyles.bodyMediumErrorContainer,
          ),
        ),
      ],
    );
  }
}
