import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Melofy/core/app_export.dart';
import 'package:Melofy/data/list_data/app_listdata.dart';
import 'package:Melofy/data/pref_data/pref_data.dart';
import 'package:Melofy/data/models/create_account_select_interest_model.dart';
import 'package:Melofy/presentation/create_account_select_interest_screen/widget/int_ope.dart';
import 'package:Melofy/widgets/custom_elevated_button.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controller/create_account_select_interest_controller.dart';

class CreateAccountSelectInterestScreen extends StatefulWidget {
  const CreateAccountSelectInterestScreen({super.key});

  @override
  State<CreateAccountSelectInterestScreen> createState() =>
      _CreateAccountSelectInterestScreenState();
}

class _CreateAccountSelectInterestScreenState
    extends State<CreateAccountSelectInterestScreen> {
  final trackList = PrefData.getGenreList();
  final checkedMap = {};
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        body: CustomImageView(
            imagePath: ImageConstant.selectionScreen,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover),
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: FutureBuilder(
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
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("        "),
                                Text(
                                  "Choose Your Genres!",
                                  style: GoogleFonts.poppins(
                                      letterSpacing: -1,
                                      color: Colors.black,
                                      fontSize: 24.fSize,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                    onPressed: () => showLogoutDialog(context),
                                    icon: Icon(Icons.logout,
                                        color:
                                            Color.fromARGB(255, 80, 194, 201),
                                        size: 27.adaptSize),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(50),
                            child: GetBuilder<
                                CreateAccountSelectInterestController>(
                              builder: (controller) {
                                return GridView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200.h,
                                    mainAxisSpacing: 0.v,
                                    crossAxisSpacing: 80.h,
                                  ),
                                  itemCount: AppListData.interestList.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        checkedMap[AppListData
                                                .interestList[index]
                                                .genreName] =
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
                          ),
                        ],
                      );
                    }
                  })),
          bottomNavigationBar: _buildContinue(context))
    ]);
  }

  static void showLogoutDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text(
          'Are you sure you want to logout?',
          style: TextStyle(fontSize: 20),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel')),
          CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                await PrefData.setIntro(true);
                await PrefData.setLogin(true);
                await PrefData.setTutorial(true);
                await PrefData.setMusicList([]);
                await PrefData.setGenreList([]);
                await PrefData.setPrefPlaylist("null");
                await Get.toNamed(AppRoutes.onboardingThree1Screen);
              },
              child: const Text('Logout')),
        ],
      ),
    );
  }

  Widget _buildContinue(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            right: MediaQuery.sizeOf(context).width * 0.07,
            left: MediaQuery.sizeOf(context).width * 0.07,
            bottom: MediaQuery.sizeOf(context).height * 0.05),
        child: ElevatedButton(
            child: Text("Continue",
                style: GoogleFonts.poppins(
                    color: AppColor.white,
                    fontSize: 22.fSize,
                    fontWeight: FontWeight.bold)),
            style:
                ButtonStyle(fixedSize: WidgetStateProperty.resolveWith((Set) {
              return Size(MediaQuery.sizeOf(context).width * .7,
                  MediaQuery.sizeOf(context).height * .08);
            }), backgroundColor: WidgetStateColor.resolveWith((Set) {
              return Color.fromARGB(255, 80, 194, 201);
            })),
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
