import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter/material.dart';

/// A controller class for the HomeMakeFriendsTabContainerPage.
///
/// This class manages the state of the HomeMakeFriendsTabContainerPage, including the
/// current homeMakeFriendsTabContainerModelObj
class HomeMakeFriendsTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {




  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 2));
}
