import '../../../core/app_export.dart';
import 'languagelist_item_model.dart';

/// This class defines the variables used in the [language_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class LanguageModel {
  Rx<List<LanguagelistItemModel>> languagelistItemList = Rx([
    LanguagelistItemModel(
        englishImage: ImageConstant.fEnglish.obs,
        englishText: "English".obs,
        checkmarkImage: ImageConstant.UnselectFlgIc.obs),
    LanguagelistItemModel(
        englishImage: ImageConstant.fIndonesia.obs,
        englishText: "Indonesia".obs,
        checkmarkImage: ImageConstant.UnselectFlgIc.obs),
    LanguagelistItemModel(
        englishImage: ImageConstant.fDeutsch.obs,
        englishText: "Deutsch".obs,
        checkmarkImage: ImageConstant.UnselectFlgIc.obs),
    LanguagelistItemModel(
        englishImage: ImageConstant.fFrench.obs,
        englishText: "French".obs,
        checkmarkImage: ImageConstant.UnselectFlgIc.obs),
    LanguagelistItemModel(
        englishImage: ImageConstant.fDeutsch1.obs,
        englishText: "Deutsch".obs,
        checkmarkImage: ImageConstant.UnselectFlgIc.obs),
    LanguagelistItemModel(
        englishImage: ImageConstant.fItalian.obs,
        englishText: "Italian".obs,
        checkmarkImage: ImageConstant.UnselectFlgIc.obs),
    LanguagelistItemModel(
        englishImage: ImageConstant.fRussian.obs,
        englishText: "Russian".obs,
        checkmarkImage: ImageConstant.UnselectFlgIc.obs)
  ]);
}
