import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/presentation/discover_filter_screen/models/discover_filter_model.dart';

/// A controller class for the DiscoverFilterScreen.
///
/// This class manages the state of the DiscoverFilterScreen, including the
/// current discoverFilterModelObj
class DiscoverFilterController extends GetxController {
  Rx<DiscoverFilterModel> discoverFilterModelObj = DiscoverFilterModel().obs;

  double distanceValue =30.0;
  bool status = true;


  RxInt i = 0.obs;
  RxInt sizeIndex = 0.obs;
  RxInt boxIndex = 0.obs;
  RxBool productPressed = false.obs;
  bool isPressed = false;


  Rx<String> preferences = "".obs;

  Rx<bool> isSelectedSwitch = false.obs;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  onSelected(dynamic value) {
    for (var element in discoverFilterModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    discoverFilterModelObj.value.dropdownItemList.refresh();
  }

  onSelected1(dynamic value) {
    for (var element in discoverFilterModelObj.value.dropdownItemList1.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    discoverFilterModelObj.value.dropdownItemList1.refresh();
  }
}
