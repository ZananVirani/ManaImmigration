// ignore_for_file: unused_import

import '../controller/home_make_friends_tab_container_controller.dart';
import '../models/users_story_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

// ignore: must_be_immutable
class UserStoryContainer extends StatelessWidget {
  final int index;
  final String userProfileImg;
  final String userName;

  UserStoryContainer(
     {
    Key? key, required this.index, required this.userProfileImg, required this.userName,
  }) : super(
          key: key,
        );



  var controller = Get.find<HomeMakeFriendsTabContainerController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,

          alignment: Alignment.bottomRight,
          children: [
            CustomImageView(
              imagePath:userProfileImg,
              height: 60.adaptSize,
              width: 60.adaptSize,
            ),
            index==0?Positioned(
              right: -0,
              bottom: -0,
              child: Container(
                padding: EdgeInsets.all(2.h),

                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFF1F1F1),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF000000).withOpacity(0.20),
                        spreadRadius: 0,
                        blurRadius: 1.h,
                      ),

                    ]
                ),
                child: Icon(Icons.add,color: AppColor.black,size: 20.h,  ),
              ),
            ):Container(),
          ],
        ),
        SizedBox(height: 8.h,),
        Text(userName,style: index==0?CustomTextStyles.bodyMediumErrorContainer:theme.textTheme.bodyMedium!.copyWith(
          color: AppColor.black40,
        ),),
      ],
    );
  }
}
