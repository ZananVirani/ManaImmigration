// ignore_for_file: unused_import

import '../../../core/app_export.dart';
import 'listcolumn_item_model.dart';
import 'genderlist_item_model.dart';

/// This class defines the variables used in the [dating_profile_details_scroll_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DatingProfileDetailsScrollModel {


  Rx<List<GenderlistItemModel>> genderlistItemList = Rx([
    GenderlistItemModel(
        genderImage: ImageConstant.genderIc.obs,
        genderText: "Gender".obs,
        maleText: "Male".obs),
    GenderlistItemModel(
        genderImage: ImageConstant.ageIc.obs,
        genderText: "Age".obs,
        maleText: "21 Year".obs),
    GenderlistItemModel(
        genderImage: ImageConstant.friendIc.obs,
        genderText: "Friends".obs,
        maleText: "1212".obs)
  ]);
}
