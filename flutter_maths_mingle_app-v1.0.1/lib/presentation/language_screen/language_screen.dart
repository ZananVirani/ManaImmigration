import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import '../language_screen/widgets/languagelist_item_widget.dart';
import 'controller/language_controller.dart';
import 'models/languagelist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_search_view.dart';

class LanguageScreen extends GetWidget<LanguageController> {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PrefData.getAppBar(onTap: () => Get.back(),text: 'Choose language'),
        body: Column(
            children: [
          Padding(
            padding:  EdgeInsets.only(top: 16.h,left: 24.h,right: 24.h),
            child: CustomSearchView(
              fillColor: AppColor.lightGray,
              suffix: SizedBox(),
              autofocus: false,
                controller: controller.searchController,
                hintText: "lbl_search".tr,
                contentPadding: EdgeInsets.only(
                    top: 16.v, right: 30.h, bottom: 16.v)
            ),
          ),

          _buildLanguageList()
        ]));
  }


  /// Section Widget
  Widget _buildLanguageList() {
    return  GetBuilder<LanguageController>(
      init: LanguageController(),
      builder: (controller) {
      return ListView.separated(
          padding: EdgeInsets.only(top: 24.h,left: 24.h,right: 24.h),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 16.h);
          },
          itemCount:
          controller.languageModelObj.value.languagelistItemList.value.length,
          itemBuilder: (context, index) {
            LanguagelistItemModel model = controller
                .languageModelObj.value.languagelistItemList.value[index];
            return GestureDetector(
                onTap: () {
                  controller.sizeIndex.value = index;
                  controller.productPressed.value =
                  !controller.productPressed.value;
                  controller.update();
                  Future.delayed(Duration(milliseconds: 400),() => Get.back(),);
                },
                child: LanguagelistItemWidget(model,isSelected: controller.sizeIndex.value == index,));
          });
    },);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
