import 'package:flutter_maths_mingle_app/core/app_export.dart';import 'package:flutter_maths_mingle_app/presentation/connect_make_friends_screen/models/connect_make_friends_model.dart';import 'package:flutter/material.dart';/// A controller class for the ConnectMakeFriendsScreen.
///
/// This class manages the state of the ConnectMakeFriendsScreen, including the
/// current connectMakeFriendsModelObj
class ConnectMakeFriendsController extends GetxController {TextEditingController greetingEditTextController = TextEditingController();

TextEditingController greetingTwoEditTextController = TextEditingController();

Rx<ConnectMakeFriendsModel> connectMakeFriendsModelObj = ConnectMakeFriendsModel().obs;

@override void onClose() { super.onClose(); greetingEditTextController.dispose(); greetingTwoEditTextController.dispose(); } 
 }
