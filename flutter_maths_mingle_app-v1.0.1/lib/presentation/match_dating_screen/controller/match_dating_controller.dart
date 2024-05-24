import 'package:flutter_maths_mingle_app/core/app_export.dart';import 'package:flutter_maths_mingle_app/presentation/match_dating_screen/models/match_dating_model.dart';/// A controller class for the MatchDatingScreen.
///
/// This class manages the state of the MatchDatingScreen, including the
/// current matchDatingModelObj
class MatchDatingController extends GetxController {Rx<MatchDatingModel> matchDatingModelObj = MatchDatingModel().obs;

 }
