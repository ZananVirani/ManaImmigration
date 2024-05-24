import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/data/list_data/app_listdata.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:flutter_maths_mingle_app/presentation/create_account_gender_screen/widget/select_gender_container.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_elevated_button.dart';

import 'controller/create_account_gender_controller.dart';

class CreateAccountGenderScreen
    extends GetWidget<CreateAccountGenderController> {
  const CreateAccountGenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: _buildAppBar(),
        appBar: PrefData.getAppBar(
            onTap: () => Get.back(), text: 'When is your gender?'),
        body: ListView(
            padding: EdgeInsets.only(left: 24.h, right: 24.h, top: 16.h),
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 8.v,
                  decoration: BoxDecoration(
                      color: appTheme.gray10002,
                      borderRadius: BorderRadius.circular(4.h)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.h),
                      child: LinearProgressIndicator(
                          value: 0.6,
                          backgroundColor: appTheme.gray10002,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              theme.colorScheme.primary)))),
              SizedBox(height: 8.h),
              RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "lbl_3".tr,
                        style: CustomTextStyles.bodyLargeff696969),
                    TextSpan(
                        text: "lbl_5".tr,
                        style: CustomTextStyles.titleLargeffd97bca)
                  ]),
                  textAlign: TextAlign.left),
              SizedBox(height: 33.v),
              GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 8.h),
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 164.h,
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 16.h),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return GetBuilder<CreateAccountGenderController>(
                      init: CreateAccountGenderController(),
                      builder: (controller) {
                        // return GestureDetector(
                        //   onTap: controller.isClickable
                        //       ? () {
                        //     controller.sizeIndex.value = index;
                        //     controller.productPressed.value =
                        //     !controller.productPressed.value;
                        //     if (AppListData.q1AnsList[index].isCorrect == true) {
                        //       print('answer ---true');
                        //       controller.isAnsTrue = true;
                        //     } else {
                        //       print('answer ---false');
                        //       controller.isAnsTrue = false;
                        //     }
                        //     controller.update();
                        //   }
                        //       : null,
                        //   child: QAnsContainer(
                        //     ans: AppListData.q1AnsList[index].ans,
                        //     isCorrect: controller.sizeIndex.value == index,
                        //   ),
                        // );
                        return GestureDetector(
                          onTap: () {
                            controller.sizeIndex.value = index;
                            controller.productPressed.value =
                                !controller.productPressed.value;
                            controller.update();
                          },
                          child: SelectGenderContainer(
                            gender: AppListData.genderList[index].gender,
                            genImg: AppListData.genderList[index].genImg,
                            isSelected: controller.sizeIndex.value == index,
                          ),
                        );
                      });
                },
              ),
              // _buildFrame(),
              SizedBox(height: 47.v),
              CustomElevatedButton(
                  text: "lbl_continue".tr,
                  onPressed: () {
                    onTapContinue();
                  }),
              SizedBox(height: 5.v)
            ]));
  }

  // /// Section Widget
  // PreferredSizeWidget _buildAppBar() {
  //   return CustomAppBar(
  //       leadingWidth: 64.h,
  //       leading: AppbarLeadingIconbutton(
  //           imagePath: ImageConstant.imgArrowLeft,
  //           margin: EdgeInsets.only(left: 24.h, top: 16.v, bottom: 16.v),
  //           onTap: () {
  //             onTapArrowLeft();
  //           }),
  //       centerTitle: true,
  //       title: AppbarSubtitle(text: "msg_when_is_your_gender".tr),
  //       styleType: Style.bgShadow);
  // }




  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the createAccountSelectInterestScreen when the action is triggered.
  onTapContinue() {
    Get.toNamed(
      AppRoutes.createAccountSelectInterestScreen,
    );
  }
}
