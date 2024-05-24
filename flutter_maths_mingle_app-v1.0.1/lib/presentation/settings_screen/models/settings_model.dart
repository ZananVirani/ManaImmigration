// ignore_for_file: unnecessary_import

import 'package:flutter_maths_mingle_app/data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [settings_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SettingsModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Near by me",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Out of city",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Out of State",
    )
  ]);
}
