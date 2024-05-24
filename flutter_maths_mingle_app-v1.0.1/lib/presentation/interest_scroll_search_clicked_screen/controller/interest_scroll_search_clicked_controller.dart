import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/presentation/interest_scroll_search_clicked_screen/models/interest_scroll_search_clicked_model.dart';

/// A controller class for the InterestScrollSearchClickedScreen.
///
/// This class manages the state of the InterestScrollSearchClickedScreen, including the
/// current interestScrollSearchClickedModelObj
class InterestScrollSearchClickedController extends GetxController {
  Rx<InterestScrollSearchClickedModel> interestScrollSearchClickedModelObj =
      InterestScrollSearchClickedModel().obs;
}
