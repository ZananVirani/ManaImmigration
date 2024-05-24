// ignore_for_file: unnecessary_import, unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:flutter_maths_mingle_app/presentation/discover_page/controller/discover_controller.dart';

import '../discover_page/models/column_item_model.dart';
import '../discover_page/models/discover_model.dart';
import '../discover_page/widgets/column_item_widget.dart';
import 'controller/discover_scroll_search_clicked_controller.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/presentation/discover_page/discover_page.dart';
import 'package:flutter_maths_mingle_app/presentation/home_make_friends_tab_container_page/home_make_friends_tab_container_page.dart';
import 'package:flutter_maths_mingle_app/presentation/messages_page/messages_page.dart';
import 'package:flutter_maths_mingle_app/presentation/profile_page/profile_page.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_bottom_bar.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_search_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore_for_file: must_be_immutable
class DiscoverScrollSearchClickedScreen
    extends GetWidget<DiscoverScrollSearchClickedController> {
  DiscoverScrollSearchClickedScreen({Key? key}) : super(key: key);

  Completer<GoogleMapController> googleMapController = Completer();

  DiscoverController intController =
  Get.put(DiscoverController(DiscoverModel().obs));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PrefData.getAppBar(onTap: () => Get.back(),text: 'Search'),
        body: ListView(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 16.h,left: 24.h,right: 24.h,bottom: 24.h),
                child: CustomSearchView(
                  autofocus: false,
                    controller: controller.searchController,
                    hintText: "lbl_search".tr),
              ),


              _buildFrame(),

              _buildColumn(),

              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.h),
                  child: Text("lbl_around_me".tr,
                      style: theme.textTheme.titleLarge)),
              CustomImageView(
                margin: EdgeInsets.symmetric(vertical: 16.h,horizontal: 24.h),
                imagePath: ImageConstant.aboutMeMap,
                height: 267.h,
              )
            ]),
        // bottomNavigationBar: _buildBottomBar()
    );
  }



  /// Section Widget
  Widget _buildFrame() {
    return Padding(
        padding: EdgeInsets.only(left: 24.h, right: 38.h),
        child:
            Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(child: Text("lbl_interest".tr, style: theme.textTheme.titleLarge)),
          GestureDetector(
            onTap:  () {
              Get.toNamed(AppRoutes.interestScrollSearchClickedScreen);
            },
            child: Text("lbl_view_all".tr,
                style: CustomTextStyles.bodyLargeGray700),
          )
        ]));
  }

  /// Section Widget
  Widget _buildColumn() {
    return SizedBox(
        height: 137.h,
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(left: 24.h,right: 23.h,top: 16.h,bottom: 24.h)  ,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 96.h,
              crossAxisCount: 4,

              crossAxisSpacing: 20.h),
          itemCount:  4,
          itemBuilder: (context, index) {
            ColumnItemModel model =
            intController.discoverModelObj.value.columnItemList.value[index];
            return GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.discoverByInterestVoneScreen);
              },
                child: ColumnItemWidget(model,));
          },)

    );
  }

  /// Section Widget
  Widget _buildMap() {
    return Container(
        height: 267.v,

        margin: EdgeInsets.only(left: 1.h),
        child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
                target: LatLng(37.43296265331129, -122.08832357078792),
                zoom: 14.4746),
            onMapCreated: (GoogleMapController controller) {
              googleMapController.complete(controller);
            },
            zoomControlsEnabled: true,
            zoomGesturesEnabled: false,
            myLocationButtonEnabled: false,
            myLocationEnabled: false));
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
      case AppRoutes.discoverPage:
        return DiscoverPage();
      case AppRoutes.messagesPage:
        return MessagesPage();
      case AppRoutes.profilePage:
        return ProfilePage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the discoverByInterestVoneScreen when the action is triggered.
  onTapColumn() {
    Get.toNamed(AppRoutes.discoverByInterestVoneScreen);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
