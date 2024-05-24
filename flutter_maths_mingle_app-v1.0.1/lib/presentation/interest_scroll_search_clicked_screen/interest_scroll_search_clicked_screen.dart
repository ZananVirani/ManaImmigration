import '../../data/pref_data/pref_data.dart';
import '../interest_scroll_search_clicked_screen/widgets/interestscroll_item_widget.dart';
import 'controller/interest_scroll_search_clicked_controller.dart';
import 'models/interestscroll_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

class InterestScrollSearchClickedScreen
    extends GetWidget<InterestScrollSearchClickedController> {
  const InterestScrollSearchClickedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PrefData.getAppBar(onTap: () => Get.back(), text: 'Interest'),
        body: Padding(
            padding: EdgeInsets.only(left: 24.h, top: 24.h, right: 24.h),
            child: Obx(() => GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 126.h,
                    crossAxisCount: 3,
                    mainAxisSpacing: 18.h,
                    crossAxisSpacing: 18.h),
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.interestScrollSearchClickedModelObj.value
                    .interestscrollItemList.value.length,
                itemBuilder: (context, index) {
                  InterestscrollItemModel model = controller
                      .interestScrollSearchClickedModelObj
                      .value
                      .interestscrollItemList
                      .value[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.discoverByInterestVoneScreen);
                    },
                      child: InterestscrollItemWidget(model));
                }))));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
