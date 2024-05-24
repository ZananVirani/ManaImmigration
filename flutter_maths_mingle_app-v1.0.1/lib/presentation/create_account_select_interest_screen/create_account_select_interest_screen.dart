import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/data/list_data/app_listdata.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:flutter_maths_mingle_app/presentation/create_account_select_interest_screen/widget/int_ope.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_elevated_button.dart';

import 'controller/create_account_select_interest_controller.dart';

class CreateAccountSelectInterestScreen
    extends GetWidget<CreateAccountSelectInterestController> {
  const CreateAccountSelectInterestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PrefData.getAppBar(
            onTap: () => Get.back(), text: 'Select up to 5 interests'),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Container(
                    height: 8.v,
                    decoration: BoxDecoration(
                        color: appTheme.gray10002,
                        borderRadius: BorderRadius.circular(4.h)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.h),
                        child: LinearProgressIndicator(
                            value: 0.81,
                            backgroundColor: appTheme.gray10002,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                theme.colorScheme.primary)))),
              ),
              SizedBox(height: 8.h),
              RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "lbl_4".tr,
                        style: CustomTextStyles.bodyLargeff696969),
                    TextSpan(
                        text: "lbl_5".tr,
                        style: CustomTextStyles.titleLargeffd97bca)
                  ]),
                  textAlign: TextAlign.left),
              SizedBox(height: 24.h),
              // Padding(
              //     padding: EdgeInsets.only(right: 61.h),
              //     child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [_buildGames(), _buildDancing()])),
              // SizedBox(height: 15.v),
              // Padding(
              //     padding: EdgeInsets.only(right: 81.h),
              //     child: Row(children: [_buildLanguage(), _buildMusic()])),
              // SizedBox(height: 15.v),
              // _buildMovie(),
              // SizedBox(height: 15.v),
              // Padding(
              //     padding: EdgeInsets.only(right: 66.h),
              //     child:
              //         Row(children: [_buildArchitecture(), _buildFashion()])),
              // SizedBox(height: 17.v),
              // Padding(
              //     padding: EdgeInsets.only(right: 70.h),
              //     child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [_buildBook(), _buildWriting()])),
              // SizedBox(height: 15.v),
              // Padding(
              //     padding: EdgeInsets.only(right: 61.h),
              //     child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [_buildNature(), _buildPainting()])),
              // SizedBox(height: 15.v),
              // Padding(
              //     padding: EdgeInsets.only(right: 72.h),
              //     child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [_buildFootball(), _buildPeople()])),
              // SizedBox(height: 15.v),
              // _buildAnimals(),

              GetBuilder<CreateAccountSelectInterestController>(
                builder: (controller) {
                  return GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 8.h),
                    scrollDirection: Axis.vertical,

                    physics: NeverScrollableScrollPhysics(),

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 24.h,
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.h,
                      crossAxisSpacing: 21.h

                    ),
                    itemCount: AppListData.interestList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          AppListData.interestList[index].isCheck =
                              !AppListData.interestList[index].isCheck;
                          controller.update();
                        },
                        child: InterestOpe(
                          opValue: AppListData.interestList[index].isCheck,
                          valueText: AppListData.interestList[index].inrerestName,
                        ),
                      );
                    },
                  );


                },
              ),
              SizedBox(height: 5.v)
            ]),
        bottomNavigationBar: _buildContinue());
  }






  /// Section Widget


  /// Section Widget
  Widget _buildContinue() {
    return Container(
        margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 24.v),
        decoration: AppDecoration.white,
        child: CustomElevatedButton(
            text: "lbl_continue".tr,
            onPressed: () {
              onTapContinue();
            }));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the createAccountUploadPhotoScreen when the action is triggered.
  onTapContinue() {
    Get.toNamed(
      AppRoutes.createAccountUploadPhotoScreen,
    );
  }
}
