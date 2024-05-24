import '../../../core/app_export.dart';
import 'userprofile_item_model.dart';

/// This class defines the variables used in the [home_make_friends_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeMakeFriendsModel {
  Rx<List<UserprofileItemModel>> userprofileItemList = Rx([
    UserprofileItemModel(
        unknownPrinterImage: ImageConstant.userPicToMatch.obs,
        unknownPrinterText:
            "when an unknown printer took a galley of type and scrambled".obs,
        kennethBrandtText: "Kenneth Brandt".obs,
        knushnaText: "Knushna".obs),
    UserprofileItemModel(
        unknownPrinterImage: ImageConstant.imgRectangle24966271x327.obs,
        unknownPrinterText:
            "when an unknown printer took a galley of type and scrambled".obs,
        kennethBrandtText: "Kenneth Brandt".obs,
        knushnaText: "Knushna".obs)
  ]);
}
