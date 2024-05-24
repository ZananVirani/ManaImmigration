// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';

import '../controller/matches_controller.dart';
import '../models/userprofile3_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

// ignore: must_be_immutable
class Userprofile3ItemWidget extends StatelessWidget {

  final String? matchesImage;
  final String? matchesName;
  final String? matchesDescription;
  final String? matchesDistance;
  Userprofile3ItemWidget(
     {
    Key? key, this.matchesImage, this.matchesName, this.matchesDescription, this.matchesDistance,

  }) : super(
          key: key,
        );



  MatchesController controller = Get.put(MatchesController());



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        Get.toNamed(AppRoutes.datingProfileDetailsVoneScreen,arguments: [matchesImage,matchesName]);


      },
      child: Container(
        decoration: AppDecoration.outlineErrorContainer.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
          boxShadow: [
            BoxShadow(
              color: Color(0x11000000),
              blurRadius: 16,

              spreadRadius: 0,
            ),
          ],

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CustomImageView(
                  imagePath: matchesImage,
                  height: 158.h,
                  width: double.infinity,
                  alignment: Alignment.center,
                ),
                Container(
                  height: 40.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                        colors: [
                          Color(0x0),
                          Color(0xF000000),
                          Color(0x33000000),
                          Color(0x80000000),
                          Color(0xB3000000),

                        ]
                    )
                  )

                ),
                Positioned(
                  bottom: 8.h,left: 8.h,
                  child: Text(
                    matchesDistance??'13 KM away',
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: AppColor.white,
                    ),
                  ),
                )

              ],
            ),
            Padding(
                padding:  EdgeInsets.only(top: 8.h,left: 8.h,bottom: 4.h),
              child: Text(
                matchesName??'Selena Bartlett',
                style: CustomTextStyles.bodyMediumBlack600
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 8.h),
              child: Text(
                matchesDescription??'Typesetting',
                style:theme.textTheme.labelLarge!.copyWith(
                  color: AppColor.black40,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
        // child: Expanded(
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Stack(
        //         alignment: Alignment.center,
        //         children: [
        //           Obx(
        //             () => CustomImageView(
        //               imagePath: matchesImage,
        //               height: 158.v,
        //               width: 154.h,
        //               radius: BorderRadius.vertical(
        //                 top: Radius.circular(8.h),
        //               ),
        //               alignment: Alignment.center,
        //             ),
        //           ),
        //           Align(
        //             alignment: Alignment.center,
        //             child: Container(
        //               padding: EdgeInsets.symmetric(
        //                 horizontal: 8.h,
        //                 vertical: 6.v,
        //               ),
        //               decoration: AppDecoration
        //                   .gradientErrorContainerToErrorContainer2
        //                   .copyWith(
        //                 borderRadius: BorderRadiusStyle.customBorderTL8,
        //               ),
        //               child: Column(
        //                 mainAxisSize: MainAxisSize.min,
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 mainAxisAlignment: MainAxisAlignment.end,
        //                 children: [
        //                   SizedBox(height: 128.v),
        //                   Obx(
        //                     () => Text(
        //                       matchesDistance!,
        //                       style: CustomTextStyles.bodySmallWhiteA700,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //       SizedBox(height: 8.v),
        //       Padding(
        //         padding: EdgeInsets.only(left: 8.h),
        //         child: Obx(
        //           () => Text(
        //             matchesName!,
        //             style: theme.textTheme.titleSmall,
        //           ),
        //         ),
        //       ),
        //       SizedBox(height: 6.v),
        //       Padding(
        //         padding: EdgeInsets.only(left: 8.h),
        //         child: Obx(
        //           () => Text(
        //            matchesDescription!,
        //             style: theme.textTheme.bodySmall,
        //           ),
        //         ),
        //       ),
        //       SizedBox(height: 6.v),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
