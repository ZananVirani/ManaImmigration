import '../controller/discover_by_interest_vone_controller.dart';
import '../models/discoverbyinterest_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

// ignore: must_be_immutable
class DiscoverbyinterestItemWidget extends StatelessWidget {
    DiscoverbyinterestItemWidget(
    this.discoverbyinterestItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  DiscoverbyinterestItemModel discoverbyinterestItemModelObj;

  var controller = Get.find<DiscoverByInterestVoneController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
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
        children: [
          Obx(
            () => CustomImageView(
              imagePath: discoverbyinterestItemModelObj
                  .interestedInPhotographyImage!.value,
              height: 60.adaptSize,
              width: 60.adaptSize,
              radius: BorderRadius.circular(
                8.h,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 5.v,
              bottom: 3.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  discoverbyinterestItemModelObj.discoverTitle!.value,
                  style: CustomTextStyles.titleSmallff000000,
                ),
                SizedBox(height: 6.v),
                Row(
                  children: [
                    CustomImageView(
                      imagePath:discoverbyinterestItemModelObj.personImg!.first,
                      height: 24.h,

                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Obx(
                        () => Text(
                          discoverbyinterestItemModelObj.thirteenKText!.value,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
