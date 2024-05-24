import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/presentation/settings_screen/models/settings_model.dart';

/// A controller class for the SettingsScreen.
///
/// This class manages the state of the SettingsScreen, including the
/// current settingsModelObj
class SettingsController extends GetxController {
  Rx<SettingsModel> settingsModelObj = SettingsModel().obs;

  Rx<bool> notifications = false.obs;

  Rx<bool> privacyPolicy = false.obs;

  // bool privacyPolicy = true;
  double  distanceValue = 65.5;
  bool peopleRange   = true;

  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element in settingsModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    settingsModelObj.value.dropdownItemList.refresh();
  }
}
