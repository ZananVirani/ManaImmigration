// ignore_for_file: must_be_immutable

import '../home_make_friends_page/widgets/userprofile_item_widget.dart';
import 'controller/home_make_friends_controller.dart';
import 'models/home_make_friends_model.dart';
import 'models/userprofile_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

class HomeMakeFriendsPage extends StatelessWidget {
  HomeMakeFriendsPage({Key? key})
      : super(
          key: key,
        );

  HomeMakeFriendsController controller =
      Get.put(HomeMakeFriendsController(HomeMakeFriendsModel().obs));

  @override
  Widget build(BuildContext context) {
    return _buildUserProfile();
  }

  /// Section Widget
  Widget _buildUserProfile() {
    return Obx(
      () => Padding(
        padding:  EdgeInsets.only(top: 8.h),
        child: ListView.separated(
          padding: EdgeInsets.only(top: 16.h,right: 24.h,left:24.h,bottom: 20.h),
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 16.h,
            );
          },
          itemCount: controller
              .homeMakeFriendsModelObj.value.userprofileItemList.value.length,
          itemBuilder: (context, index) {
            UserprofileItemModel model = controller.homeMakeFriendsModelObj
                .value.userprofileItemList.value[index];
            return UserprofileItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }
}
