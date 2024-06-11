import 'controller/home_make_friends_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/presentation/discover_page/discover_page.dart';
import 'package:flutter_maths_mingle_app/presentation/home_make_friends_tab_container_page/home_make_friends_tab_container_page.dart';
import 'package:flutter_maths_mingle_app/presentation/messages_page/messages_page.dart';
import 'package:flutter_maths_mingle_app/presentation/profile_page/profile_page.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_bottom_bar.dart';

class HomeMakeFriendsContainerScreen
    extends GetWidget<HomeMakeFriendsContainerController> {
  const HomeMakeFriendsContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Navigator(
          key: Get.nestedKey(1),
          initialRoute: AppRoutes.homeMakeFriendsTabContainerPage,
          onGenerateRoute: (routeSetting) => GetPageRoute(
              page: () => getCurrentPage(routeSetting.name!),
              transition: Transition.noTransition)),
      // bottomNavigationBar: _buildBottomBar()
    ));
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
}
