import '../controller/dating_profile_details_scroll_controller.dart';
import '../models/genderlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

// ignore: must_be_immutable
class GenderlistItemWidget extends StatelessWidget {
  GenderlistItemWidget(
    this.genderlistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  GenderlistItemModel genderlistItemModelObj;

  var controller = Get.find<DatingProfileDetailsScrollController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.h,
        vertical: 8.h,
      ),
      decoration: AppDecoration.fillGray100.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => CustomImageView(
              imagePath: genderlistItemModelObj.genderImage!.value,
              height: 48.adaptSize,
              width: 48.adaptSize,
            ),
          ),
          SizedBox(height: 8.v),
          Obx(
            () => Text(
              genderlistItemModelObj.genderText!.value,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          // SizedBox(height: 3.v),
          Obx(
            () => Text(
              genderlistItemModelObj.maleText!.value,
              style: theme.textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
