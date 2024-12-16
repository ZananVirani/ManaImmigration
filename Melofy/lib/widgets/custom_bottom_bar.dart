/**
 * Class that defines the widget for the bottom nav bar.
 */

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:Melofy/core/app_export.dart';
import 'package:Melofy/presentation/bottombar_screen/controller/bottombar_screen_controller.dart';

import '../data/pref_data/pref_data.dart';

// ignore: must_be_immutable
class CustomBottomBar extends StatelessWidget {
  AudioPlayer player;

  CustomBottomBar(
    AudioPlayer player, {
    Key? key,
  })  : this.player = player,
        super(
          key: key,
        );

  RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarScreenController>(
      builder: (controller) {
        return BottomNavigationBar(
          backgroundColor: AppColor.white,
          selectedIconTheme:
              IconThemeData(color: AppColor.primaryColor, size: 20.h),
          unselectedIconTheme: IconThemeData(
            color: AppColor.black40,
            size: 20.h,
          ),
          unselectedItemColor: AppColor.black40,
          selectedItemColor: AppColor.primaryColor,
          selectedLabelStyle: theme.textTheme.titleSmall!.copyWith(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.w400,
          ),
          unselectedLabelStyle: theme.textTheme.titleSmall!.copyWith(
            color: AppColor.black40,
            fontWeight: FontWeight.w400,
          ),
          currentIndex: PrefData.currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: CustomImageView(
                imagePath: ImageConstant.navHomeIc,
                height: 24.v,
                width: 24.h,
                color: Color(0xFF7C7C7C),
                margin: EdgeInsets.only(bottom: 8.h),
              ),
              activeIcon: CustomImageView(
                imagePath: ImageConstant.navHomeIc,
                color: AppColor.primaryColor,
                height: 24.h,
                width: 24.h,
                margin: EdgeInsets.only(bottom: 8.h),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              // Home Page Icon
              icon: CustomImageView(
                imagePath: ImageConstant.navExploreIc,
                height: 24.v,
                width: 24.h,
                color: Color(0xFF7C7C7C),
                margin: EdgeInsets.only(bottom: 8.h),
              ),
              // My Liked Songs Icon
              activeIcon: CustomImageView(
                imagePath: ImageConstant.navExploreIc,
                color: AppColor.primaryColor,
                height: 24.h,
                width: 24.h,
                margin: EdgeInsets.only(bottom: 8.h),
              ),
              label: 'My Liked Songs',
            ),
          ],
          onTap: (index) {
            // Go to the selected page and highlight the correct icon.
            if (index != PrefData.currentIndex) {
              PrefData.currentIndex = index;
              if (index == 0)
                Navigator.pop(context);
              else
                Navigator.pushNamed(context, '/liked_songs', arguments: player);
            }
            controller.update();
          },
        );
      },
      init: BottomBarScreenController(),
    );
  }
}
