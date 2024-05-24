import 'package:flutter_maths_mingle_app/core/app_export.dart';import 'package:flutter_maths_mingle_app/presentation/home_search_partners_swipe_left_tab_container_screen/models/home_search_partners_swipe_left_tab_container_model.dart';import 'package:flutter/material.dart';/// A controller class for the HomeSearchPartnersSwipeLeftTabContainerScreen.
///
/// This class manages the state of the HomeSearchPartnersSwipeLeftTabContainerScreen, including the
/// current homeSearchPartnersSwipeLeftTabContainerModelObj
class HomeSearchPartnersSwipeLeftTabContainerController extends GetxController with  GetSingleTickerProviderStateMixin {Rx<HomeSearchPartnersSwipeLeftTabContainerModel> homeSearchPartnersSwipeLeftTabContainerModelObj = HomeSearchPartnersSwipeLeftTabContainerModel().obs;

late TabController tabviewController = Get.put(TabController(vsync: this, length: 2));

 }
