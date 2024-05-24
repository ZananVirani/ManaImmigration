import '../controller/discover_controller.dart';
import '../models/userprofile2_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

// ignore: must_be_immutable
class Userprofile2ItemWidget extends StatelessWidget {
  Userprofile2ItemWidget(
    this.userprofile2ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Userprofile2ItemModel userprofile2ItemModelObj;

  var controller = Get.find<DiscoverController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 16.h),
      child: SizedBox(
        height: 126.h,
        width: 98.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Obx(
              () => CustomImageView(
                imagePath: userprofile2ItemModelObj.userImage!.value,
                height: 126.h,
                width: 98.h,
                radius: BorderRadius.circular(
                  8.h,
                ),
                alignment: Alignment.center,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(8.h),

              decoration: AppDecoration
                  .gradientErrorContainerToErrorContainer1
                  .copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder8,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Obx(
                    () => Text(
                      userprofile2ItemModelObj.userName!.value,
                      style: CustomTextStyles.bodyMediumWhiteA700,
                    ),
                  ),

                  Obx(
                    () => Text(
                      userprofile2ItemModelObj.userText!.value,
                      style: CustomTextStyles.bodySmallGray400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
