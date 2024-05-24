import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/presentation/messages_page/models/messages_model.dart';

import '../../../data/pref_data/pref_data.dart';

/// A controller class for the MessagesPage.
///
/// This class manages the state of the MessagesPage, including the
/// current messagesModelObj
class MessagesController extends GetxController {
  MessagesController(this.messagesModelObj);

  Rx<MessagesModel> messagesModelObj;
  bool isFirstChat = false;

  isMathed() async {
    isFirstChat = await PrefData.getChatFirstTime();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isMathed();
  }
}
