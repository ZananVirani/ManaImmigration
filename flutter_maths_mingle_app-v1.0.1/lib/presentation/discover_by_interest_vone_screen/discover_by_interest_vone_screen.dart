// ignore_for_file: unused_import

import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';

import '../discover_by_interest_vone_screen/widgets/discoverbyinterest_item_widget.dart';
import 'controller/discover_by_interest_vone_controller.dart';
import 'models/discoverbyinterest_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/presentation/discover_page/discover_page.dart';
import 'package:flutter_maths_mingle_app/presentation/home_make_friends_tab_container_page/home_make_friends_tab_container_page.dart';
import 'package:flutter_maths_mingle_app/presentation/messages_page/messages_page.dart';
import 'package:flutter_maths_mingle_app/presentation/profile_page/profile_page.dart';
import 'package:flutter_maths_mingle_app/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:flutter_maths_mingle_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_maths_mingle_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_bottom_bar.dart';

class DiscoverByInterestVoneScreen
    extends GetWidget<DiscoverByInterestVoneController> {
  const DiscoverByInterestVoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrefData.getAppBar(
          onTap: () => Get.back(), text: 'msg_discover_by_interest'.tr),
      body: _buildDiscoverByInterest(),
      // bottomNavigationBar: _buildBottomBar()
    );
  }

  /// Section Widget
  Widget _buildDiscoverByInterest() {
    return Obx(() => ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 24.h),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 16.h);
        },
        itemCount: controller.discoverByInterestVoneModelObj.value
            .discoverbyinterestItemList.value.length,
        itemBuilder: (context, index) {
          DiscoverbyinterestItemModel model = controller
              .discoverByInterestVoneModelObj
              .value
              .discoverbyinterestItemList
              .value[index];
          return DiscoverbyinterestItemWidget(model);
        }));
  }

  /// Section Widget
  // Widget _buildBottomBar() {
  //   return CustomBottomBar(onChanged: (BottomBarEnum type) {
  //     Get.toNamed(getCurrentRoute(type), id: 1);
  //   });
  // }

  ///Handling route based on bottom click actions
  // String getCurrentRoute(BottomBarEnum type) {
  //   switch (type) {
  //     case BottomBarEnum.Home:
  //       return AppRoutes.homeMakeFriendsTabContainerPage;
  //     case BottomBarEnum.Explore:
  //       return AppRoutes.discoverPage;
  //     case BottomBarEnum.Add:
  //       return "/";
  //     case BottomBarEnum.Match:
  //       return AppRoutes.messagesPage;
  //     case BottomBarEnum.Chat:
  //       return AppRoutes.profilePage;
  //     default:
  //       return "/";
  //   }
  // }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homeMakeFriendsTabContainerPage:
        return HomeMakeFriendsTabContainerPage();
      // case AppRoutes.discoverPage:
      //  return DiscoverPage();
      case AppRoutes.messagesPage:
        return MessagesPage();
      case AppRoutes.profilePage:
        return ProfilePage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
