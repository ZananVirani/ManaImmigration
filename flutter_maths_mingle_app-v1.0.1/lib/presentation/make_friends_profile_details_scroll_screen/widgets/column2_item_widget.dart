import '../controller/make_friends_profile_details_scroll_controller.dart';
import '../models/column2_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class Column2ItemWidget extends StatelessWidget {
  Column2ItemWidget(
    this.column2ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Column2ItemModel column2ItemModelObj;

  var controller = Get.find<MakeFriendsProfileDetailsScrollController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 67.h,
      child: Padding(
        padding: EdgeInsets.only(bottom: 1.v),
        child: Column(
          children: [
            Obx(
              () => CustomIconButton(
                height: 67.adaptSize,
                width: 67.adaptSize,
                padding: EdgeInsets.all(17.h),
                child: CustomImageView(
                  imagePath: column2ItemModelObj.dynamicProperty1!.value,
                ),
              ),
            ),
            SizedBox(height: 8.v),
            Obx(
              () => Text(
                column2ItemModelObj.dynamicProperty2!.value,
                style: CustomTextStyles.bodyMediumErrorContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
