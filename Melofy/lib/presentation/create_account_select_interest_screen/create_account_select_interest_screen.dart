import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Melofy/core/app_export.dart';
import 'package:Melofy/data/list_data/app_listdata.dart';
import 'package:Melofy/data/pref_data/pref_data.dart';
import 'package:Melofy/data/models/create_account_select_interest_model.dart';
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
    return PopScope(
      canPop: false,
      child: Stack(children: [
        Scaffold(
          body: CustomImageView(
              imagePath: ImageConstant.selectionScreen,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover),
        ),
        SafeArea(
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PreferredSize(
                preferredSize: Size(
                    double.infinity, MediaQuery.sizeOf(context).height * 0.2),
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Choose Your Genres!",
                        style: GoogleFonts.poppins(
                            letterSpacing: -1,
                            color: Colors.black,
                            fontSize: 24.fSize,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.03,
                          height: 0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () => showLogoutDialog(context),
                          icon: Icon(Icons.logout,
                              color: AppColor.primaryColor, size: 27.adaptSize),
                        ),
                      )
                    ],
                  ),
                ),
              ),
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
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 60, right: 60, top: 20, bottom: 20),
                                  child: SingleChildScrollView(
                                    child: GetBuilder<
                                        CreateAccountSelectInterestController>(
                                      builder: (controller) {
                                        return GridView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          physics: ScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithMaxCrossAxisExtent(
                                                  maxCrossAxisExtent: 150.h,
                                                  mainAxisSpacing: 4.v,
                                                  crossAxisSpacing: 20.h,
                                                  mainAxisExtent: 135.v),
                                          itemCount:
                                              AppListData.interestList.length,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      checkedMap[
                                                              AppListData
                                                                  .interestList[
                                                                      index]
                                                                  .genreName] =
                                                          !checkedMap[
                                                              AppListData
                                                                  .interestList[
                                                                      index]
                                                                  .genreName];
                                                      controller.update();
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: checkedMap[
                                                              AppListData
                                                                  .interestList[
                                                                      index]
                                                                  .genreName]
                                                          ? buildGenreImageLiked(
                                                              context,
                                                              AppListData
                                                                  .interestList[
                                                                      index]
                                                                  .genreName)
                                                          : buildGenreImage(
                                                              context,
                                                              AppListData
                                                                  .interestList[
                                                                      index]
                                                                  .genreName),
                                                    )),
                                                Text(
                                                    AppListData
                                                                .interestList[
                                                                    index]
                                                                .inrerestName
                                                                .length >
                                                            11
                                                        ? "Rap"
                                                        : AppListData
                                                            .interestList[index]
                                                            .inrerestName,
                                                    style: GoogleFonts.poppins(
                                                        color: AppColor.black,
                                                        fontSize: 16.fSize,
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      })),
              bottomNavigationBar: _buildContinue(context)),
        )
      ]),
    );
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
                Navigator.pop(context);
                await PrefData.setIntro(true);
                await PrefData.setLogin(true);
                await PrefData.setTutorial(true);
                await PrefData.setMusicList([]);
                await PrefData.setGenreList([]);
                await PrefData.setPrefPlaylist("null");
                await Get.offAndToNamed(AppRoutes.onboardingThree1Screen);
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
              return AppColor.primaryColor;
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

              if (count >= 1) {
                PrefData.setGenreList(finalList);
                bool isLogin = await PrefData.getLogin();

                if (isLogin) {
                  onTapNext(context);
                } else {
                  Get.offAndToNamed(AppRoutes.bottomBarScreen);
                }
              } else
                await showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text("Select at least 1 genre."),
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

  Widget buildGenreImage(BuildContext context, String path) {
    return Container(
        width: 80.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                width: 0.5, strokeAlign: BorderSide.strokeAlignOutside)),
        child: CustomImageView(
            imagePath: 'assets/images/genre_$path.png', fit: BoxFit.cover));
  }

  Widget buildGenreImageLiked(BuildContext context, String path) {
    return Stack(
      children: [
        Container(
            width: 80.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    width: 0.5, strokeAlign: BorderSide.strokeAlignOutside)),
            child: CustomImageView(
                imagePath: 'assets/images/genre_$path.png', fit: BoxFit.cover)),
        Opacity(
          opacity: 0.9,
          child: Container(
              width: 80.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 0.5, strokeAlign: BorderSide.strokeAlignOutside)),
              child: CustomImageView(
                  radius: BorderRadius.all(Radius.circular(40.h)),
                  imagePath: 'assets/images/app_icon.png',
                  fit: BoxFit.cover)),
        ),
        Container(
            width: 80.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    width: 0.5, strokeAlign: BorderSide.strokeAlignOutside)),
            child: CustomImageView(
                imagePath: 'assets/images/musicM.png', fit: BoxFit.contain)),
      ],
    );
  }
}
