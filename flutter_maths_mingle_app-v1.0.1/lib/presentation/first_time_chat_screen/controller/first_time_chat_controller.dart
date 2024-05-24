import 'package:flutter_maths_mingle_app/core/app_export.dart';import 'package:flutter_maths_mingle_app/presentation/first_time_chat_screen/models/first_time_chat_model.dart';/// A controller class for the FirstTimeChatScreen.
///
/// This class manages the state of the FirstTimeChatScreen, including the
/// current firstTimeChatModelObj
class FirstTimeChatController extends GetxController {Rx<FirstTimeChatModel> firstTimeChatModelObj = FirstTimeChatModel().obs;

 }
