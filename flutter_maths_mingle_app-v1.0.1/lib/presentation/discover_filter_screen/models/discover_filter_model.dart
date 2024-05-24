// ignore_for_file: unnecessary_import

import 'package:flutter_maths_mingle_app/data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [discover_filter_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DiscoverFilterModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "People nearby",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Out of city",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Out of state",
    )
  ]);

  Rx<List<String>> radioList = Rx(["lbl_make_friends", "lbl_dating"]);

  Rx<List<SelectionPopupModel>> dropdownItemList1 = Rx([
    SelectionPopupModel(
      id: 1,
      title: "21",
      isSelected: false,
    ),
    SelectionPopupModel(
      id: 2,
      title: "22",
    ),
    SelectionPopupModel(
      id: 3,
      title: "23",
    ),
    SelectionPopupModel(
      id: 4,
      title: "24",
    ),
    SelectionPopupModel(
      id: 5,
      title: "25  ",
    ),
  ]);
}
