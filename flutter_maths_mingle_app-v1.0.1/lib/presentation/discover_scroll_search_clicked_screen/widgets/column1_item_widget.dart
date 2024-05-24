import '../controller/discover_scroll_search_clicked_controller.dart';
import '../models/column1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class Column1ItemWidget extends StatelessWidget {
  Column1ItemWidget(
    this.column1ItemModelObj, {
    Key? key,
    this.onTapColumn,
  }) : super(
          key: key,
        );

  Column1ItemModel column1ItemModelObj;

  var controller = Get.find<DiscoverScrollSearchClickedController>();

  VoidCallback? onTapColumn;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 67.h,
      child: GestureDetector(
        onTap: () {
          onTapColumn!.call();
        },
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
                    imagePath: column1ItemModelObj.dynamicProperty1!.value,
                  ),
                ),
              ),
              SizedBox(height: 8.v),
              Obx(
                () => Text(
                  column1ItemModelObj.dynamicProperty2!.value,
                  style: CustomTextStyles.bodyMediumErrorContainer,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
