import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Melofy/core/app_export.dart';
import 'package:Melofy/data/list_data/app_listdata.dart';
import 'package:Melofy/data/pref_data/pref_data.dart';
import 'package:Melofy/data/models/create_account_select_interest_model.dart';
import 'package:Melofy/presentation/create_account_select_interest_screen/widget/int_ope.dart';
import 'package:Melofy/widgets/custom_elevated_button.dart';

import 'controller/create_account_select_interest_controller.dart';

class CreateAccountSelectInterestScreen
    extends GetWidget<CreateAccountSelectInterestController> {
  CreateAccountSelectInterestScreen({Key? key}) : super(key: key);

  final trackList = PrefData.getGenreList();
  final checkedMap = {};
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: trackList,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Text("");
          else {
            for (CreateAccountSelectInterestModel genre
                in AppListData.interestList) {
              checkedMap[genre.genreName] =
                  snapshot.data!.contains(genre.genreName);
            }
            return Scaffold(
                appBar: PrefData.getInterestAppbar(context,
                    onTap: () => Navigator.pop(context),
                    text: 'Select 1-5 interests',
                    isLeadingIcon: true),
                body: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 24, 0.0, 16),
                        child: Container(
                            height: 8.v,
                            width: 327.h,
                            decoration: BoxDecoration(
                                color: appTheme.gray10002,
                                borderRadius: BorderRadius.circular(4.h)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.h),
                                child: LinearProgressIndicator(
                                    value: 1.0,
                                    backgroundColor: appTheme.gray10002,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        theme.colorScheme.primary)))),
                      ),
                      // RichText(
                      //     text: TextSpan(
                      //         text: "2/2",
                      //         style: GoogleFonts.aDLaMDisplay(
                      //           color: AppColor.primaryColor,
                      //           fontSize: 20,
                      //         )),
                      //     textAlign: TextAlign.left),
                      SizedBox(height: 50.h),
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
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 24.h,
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 16.h,
                                    crossAxisSpacing: 21.h),
                            itemCount: AppListData.interestList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  checkedMap[AppListData
                                          .interestList[index].genreName] =
                                      !checkedMap[AppListData
                                          .interestList[index].genreName];
                                  controller.update();
                                },
                                child: InterestOpe(
                                  opValue: checkedMap[AppListData
                                      .interestList[index].genreName],
                                  valueText: AppListData
                                      .interestList[index].inrerestName,
                                ),
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(height: 5.v)
                    ]),
                bottomNavigationBar: _buildContinue(context));
          }
        });
  }

  /// Section Widget

  /// Section Widget
  Widget _buildContinue(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 24.v),
        decoration: AppDecoration.white,
        child: CustomElevatedButton(
            text: "lbl_continue".tr,
            onPressed: () async {
              int count = 0;
              List<String> finalList = [];
              checkedMap.forEach((key, element) {
                if (element == true) {
                  finalList.add(key);
                  count++;
                }
              });

              if (count >= 1 && count <= 5) {
                PrefData.setGenreList(finalList);
                bool isLogin = await PrefData.getLogin();

                if (isLogin) {
                  onTapNext(context);
                } else {
                  Get.toNamed(AppRoutes.bottomBarScreen);
                }
              } else
                await showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text("Select 1-5 (inclusive) items."),
                        actions: [
                          CupertinoDialogAction(
                            child: Text("Ok"),
                            onPressed: () => Navigator.pop(context),
                          )
                        ],
                      );
                    });
            }));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the createAccountUploadPhotoScreen when the action is triggered.
  onTapContinue() {
    Get.toNamed(
      AppRoutes.bottomBarScreen,
    );
  }

  onTapNext(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 24.h),
              clipBehavior: Clip.none,
              scrollable: true,
              content: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.h),
                child: Column(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.successIc,
                      height: 100.h,
                      width: 100.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
                      child: Text('You\'re all set!',
                          style: CustomTextStyles.headlineSmallff000000),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 24.h, right: 24.h, bottom: 16.h),
                      child: Text(
                        'Great!\nYour music journey awaits...',
                        style: CustomTextStyles.bodyLargeff696969,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              actions: [
                CustomElevatedButton(
                    text: "Get started".tr,
                    onPressed: () {
                      PrefData.setLogin(false);
                      Get.offAndToNamed(AppRoutes.bottomBarScreen);
                    })
              ],
              backgroundColor: AppColor.white,
              surfaceTintColor: Colors.white,
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.h))),
            ));
  }
}
