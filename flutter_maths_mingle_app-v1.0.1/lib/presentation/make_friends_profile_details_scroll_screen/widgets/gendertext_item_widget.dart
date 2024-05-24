import '../controller/make_friends_profile_details_scroll_controller.dart';
import '../models/gendertext_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

// ignore: must_be_immutable
class GendertextItemWidget extends StatelessWidget {
  GendertextItemWidget(
    this.gendertextItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  GendertextItemModel gendertextItemModelObj;

  var controller = Get.find<MakeFriendsProfileDetailsScrollController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 23.h,
        vertical: 7.v,
      ),
      decoration: AppDecoration.fillGray100.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      width: 98.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => CustomImageView(
              imagePath: gendertextItemModelObj.genderImage!.value,
              height: 48.adaptSize,
              width: 48.adaptSize,
            ),
          ),
          SizedBox(height: 8.v),
          Obx(
            () => Text(
              gendertextItemModelObj.genderText!.value,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 3.v),
          Obx(
            () => Text(
              gendertextItemModelObj.maleText!.value,
              style: theme.textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
