import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:flutter_maths_mingle_app/presentation/matches_screen/models/matches_model.dart';

/// A controller class for the MatchesScreen.
///
/// This class manages the state of the MatchesScreen, including the
/// current matchesModelObj
class MatchesController extends GetxController {
  Rx<MatchesModel> matchesModelObj = MatchesModel().obs;

  bool isMatch = false;


       isMathed() async {
         isMatch = await PrefData.getIsMatched();
         update();
       }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isMathed();

  }
}
