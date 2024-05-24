import 'package:flutter_maths_mingle_app/core/app_export.dart';import 'package:flutter_maths_mingle_app/presentation/discover_scroll_search_clicked_screen/models/discover_scroll_search_clicked_model.dart';import 'package:flutter/material.dart';/// A controller class for the DiscoverScrollSearchClickedScreen.
///
/// This class manages the state of the DiscoverScrollSearchClickedScreen, including the
/// current discoverScrollSearchClickedModelObj
class DiscoverScrollSearchClickedController extends GetxController {TextEditingController searchController = TextEditingController();

Rx<DiscoverScrollSearchClickedModel> discoverScrollSearchClickedModelObj = DiscoverScrollSearchClickedModel().obs;

@override void onClose() { super.onClose(); searchController.dispose(); } 
 }
