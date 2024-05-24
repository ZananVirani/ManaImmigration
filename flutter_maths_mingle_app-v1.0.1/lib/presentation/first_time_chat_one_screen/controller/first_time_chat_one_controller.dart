// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:flutter_maths_mingle_app/presentation/first_time_chat_one_screen/models/first_time_chat_one_model.dart';

/// A controller class for the FirstTimeChatOneScreen.
///
/// This class manages the state of the FirstTimeChatOneScreen, including the
/// current firstTimeChatOneModelObj
class FirstTimeChatOneController extends GetxController {

 double distanceValue =0.0;
 double value1 = 20;


bool isVoiceRecord = false;
 bool isVoiceChat = true;
 bool clickKeyboard = false;

  Rx<FirstTimeChatOneModel> firstTimeChatOneModelObj =
      FirstTimeChatOneModel().obs;

  TextEditingController chatController = TextEditingController();




 // isMathed() async {
 //  isVoiceChat = await PrefData.getClickMic();
 //  update();
 //  clickKeyboard = await PrefData.getClickKeyboard();
 //  update();
 // }



 @override
  void onInit() {
    // TODO: implement onInit
  // isMathed();
    super.onInit();

  }
}
