import '../controller/home_make_friends_controller.dart';
import '../models/userprofile_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget(
    this.userprofileItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserprofileItemModel userprofileItemModelObj;

  var controller = Get.find<HomeMakeFriendsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
        boxShadow: [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 16.h,
            offset: Offset(0, 5),
            spreadRadius: 0,
          ),
        ]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Obx(
                () => CustomImageView(
                  imagePath:
                      userprofileItemModelObj.unknownPrinterImage!.value,
                  height: 271.h,
                  width: 327.h,
                  radius: BorderRadius.circular(8.h) ,
                  alignment: Alignment.center,
                ),
              ),

              Container(
                height: 250.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Color(0x0),
                        Color(0x8A000000)
                      ]),
                  borderRadius: BorderRadiusStyle.roundedBorder8,
                ),
              ),


              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: 266.h,
                  margin: EdgeInsets.only(
                    left: 8.h,
                    bottom: 6.v,
                  ),
                  child: Obx(
                    () => Text(
                      userprofileItemModelObj.unknownPrinterText!.value,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodySmallWhiteA700.copyWith(
                        height: 1.50,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(
              top: 8.h,
              left: 13.5.h,
              right: 16.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgEllipse,
                  height: 40.adaptSize,
                  width: 40.adaptSize,

                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            userprofileItemModelObj.kennethBrandtText!.value,
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                        SizedBox(height: 1.v),
                        Obx(
                          () => Text(
                            userprofileItemModelObj.knushnaText!.value,
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                CustomImageView(
                 imagePath : ImageConstant.likeIc,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                
                ),
                CustomImageView(
                  imagePath: ImageConstant.chatIc,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(
                    left: 16.h,
                    top: 8.v,
                    bottom: 8.v,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.v),
        ],
      ),
    );
  }
}
