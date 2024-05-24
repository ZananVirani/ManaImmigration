// ignore_for_file: unused_import

import '../controller/discover_controller.dart';
import '../models/column_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ColumnItemWidget extends StatelessWidget {
    ColumnItemWidget(
    this.columnItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ColumnItemModel columnItemModelObj;

  var controller = Get.find<DiscoverController>();

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Container(
          height: 67.h,
          width: 67.h,
          margin: EdgeInsets.only(bottom: 7.h),
          decoration: BoxDecoration(
            color: AppColor.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0x11000000),
                blurRadius: 16,
                offset: Offset(0, 5),
                spreadRadius: 0,
              )
            ]

          ),
          child: CustomImageView(
            imagePath: columnItemModelObj.dynamicProperty1!.value,
            height: 32.h,
            width: 32.h,
            margin: EdgeInsets.all(18.h),
          ),
        ),
       
        Obx(
          () => Text(
            columnItemModelObj.dynamicProperty2!.value,
            style: CustomTextStyles.bodyMediumErrorContainer,
          ),
        ),
      ],
    );
  }
}
