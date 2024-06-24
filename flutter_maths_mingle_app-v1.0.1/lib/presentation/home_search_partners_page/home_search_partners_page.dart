// ignore_for_file: unnecessary_import

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_maths_mingle_app/API/api_calls.dart';
import 'package:flutter_maths_mingle_app/API/track.dart';
import 'package:flutter_maths_mingle_app/data/list_data/app_listdata.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_bottom_bar.dart';
// import 'package:flutter_maths_mingle_app/data/list_data/app_listdata.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

import 'controller/home_search_partners_controller.dart';
import 'models/home_search_partners_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

class HomeSearchPartnersPage extends StatefulWidget {
  const HomeSearchPartnersPage({super.key});

  @override
  State<HomeSearchPartnersPage> createState() => _HomeSearchPartnersPageState();
}

class _HomeSearchPartnersPageState extends State<HomeSearchPartnersPage>
    with TickerProviderStateMixin {
  bool isPlaying = false;
  bool loaded = false;
  HomeSearchPartnersController controller =
      Get.put(HomeSearchPartnersController(HomeSearchPartnersModel().obs));

  late AnimationController _animationController;
  late AudioPlayer _player;
  late Future<Track> track;

  @override
  void initState() {
    track = fetchTrack().then(
      (value) {
        print("Success!!!");
        _player.setSource(UrlSource(value.previewUrl!));
        return value;
      },
    ).catchError((value) {
      print("Error!!!");
      print(value);
      return value;
    });
    _player = AudioPlayer();
    this._animationController = AnimationController(
        value: 1.0, vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  Future<Track> fetchTrack() async {
    var trackList = await MakeAPICall.searchForSong();
    var newTrack = trackList.first;
    return newTrack;
  }

  @override
  Widget build(BuildContext context) {
    return _buildFiftyColumn();
  }

  Widget _buildFiftyColumn() {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomBar(),
        backgroundColor: PrimaryColors().mainColor,
        body: Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: CardSwiper(
            backCardOffset: Offset(0, 0),
            cardBuilder: (context, index, horizontalOffsetPercentage,
                verticalOffsetPercentage) {
              return ListView(
                padding: EdgeInsets.only(top: 70.h, right: 24.h, left: 24.h),
                shrinkWrap: true,
                children: [
                  Container(
                    height: 575.v,
                    padding: EdgeInsets.only(
                        bottom: 24.h, top: 16.h, left: 16.h, right: 16.h),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x11000000),
                          blurRadius: 16.h,
                          offset: Offset(0, 5),
                          spreadRadius: 0,
                        ),
                      ],
                      borderRadius: BorderRadiusStyle.roundedBorder8,
                      color: PrimaryColors().secondaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            FutureBuilder(
                              future: track,
                              builder: (context, snapshot) {
                                if (snapshot.hasData)
                                  return Image.network(
                                      width: 400.h,
                                      snapshot.data!.album!.images!.first.url);
                                else if (snapshot.hasError)
                                  return CustomImageView(
                                    imagePath: ImageConstant.travis,
                                  );
                                else
                                  return const CircularProgressIndicator();
                              },
                            ),
                          ],
                        ),
                        FutureBuilder(
                            future: track,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var songName = snapshot.data!.name!;
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    songName.length > 65
                                        ? songName.substring(0, 61) + "..."
                                        : songName,
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                        fontSize: 18.fSize,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.black),
                                  ),
                                );
                              } else
                                return Text(
                                  "Not found",
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.black),
                                );
                            }),
                        FutureBuilder(
                            future: track,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                String allInfo =
                                    snapshot.data!.artists!.first.name! +
                                        " - " +
                                        snapshot.data!.album!.name!;
                                return Text(
                                  allInfo.length > 40
                                      ? allInfo.substring(0, 38) + "..."
                                      : allInfo,
                                  style: theme.textTheme.bodyMedium,
                                );
                              } else {
                                return Text(
                                  "Not found",
                                  style: theme.textTheme.bodyMedium,
                                );
                              }
                            }),
                        FutureBuilder(
                            future: track,
                            builder: (context, snapshot) {
                              if (snapshot.hasData)
                                return Text(
                                  "Popularity (0-100) : ${snapshot.data!.popularity!}",
                                  style: theme.textTheme.bodyMedium,
                                );
                              else {
                                return Text(
                                  "Not found",
                                  style: theme.textTheme.bodyMedium,
                                );
                              }
                            }),
                        Padding(
                          padding: EdgeInsets.only(top: 16.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.swiperController.swipe(
                                    CardSwiperDirection.left,
                                  );
                                  controller.update();
                                },
                                child: Container(
                                  width: 56.h,
                                  height: 56.h,
                                  decoration: BoxDecoration(
                                      color: AppColor.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x11000000),
                                          blurRadius: 16,
                                          spreadRadius: 0,
                                        )
                                      ]),
                                  child: Icon(
                                    Icons.close_rounded,
                                    size: 24.h,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: GestureDetector(
                                  onTap: () async {
                                    setState(() {
                                      isPlaying = !isPlaying;

                                      isPlaying
                                          ? _animationController.reverse()
                                          : _animationController.forward();
                                    });
                                    isPlaying
                                        ? await _player.resume()
                                        : await _player.pause();
                                  },
                                  child: Container(
                                    width: 56.h,
                                    height: 56.h,
                                    decoration: BoxDecoration(
                                        color: PrimaryColors().blueGray500,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x11000000),
                                            blurRadius: 16,
                                            spreadRadius: 0,
                                          )
                                        ]),
                                    child: Center(
                                      child: AnimatedIcon(
                                          size: 24.h,
                                          icon: AnimatedIcons.pause_play,
                                          progress: _animationController),
                                    ),
                                  ),
                                ),
                              ),
                              // Container(
                              //   margin: EdgeInsets.symmetric(horizontal: 24.h),
                              //   width: 56.h,
                              //   height: 56.h,
                              //   decoration: BoxDecoration(
                              //       color: AppColor.primaryColor,
                              //       shape: BoxShape.circle,
                              //       boxShadow: [
                              //         BoxShadow(
                              //           color: Color(0x11000000),
                              //           blurRadius: 16,
                              //           spreadRadius: 0,
                              //         )
                              //       ]),
                              //   child: CustomImageView(
                              //     imagePath: ImageConstant.starWhiteIc,
                              //     margin: EdgeInsets.all(16.h),
                              //   ),
                              // ),
                              GestureDetector(
                                onTap: () {
                                  controller.swiperController
                                      .swipe(CardSwiperDirection.right);

                                  controller.update();
                                },
                                child: Container(
                                  width: 56.h,
                                  height: 56.h,
                                  decoration: BoxDecoration(
                                      color: AppColor.primaryColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x11000000),
                                          blurRadius: 16,
                                          spreadRadius: 0,
                                        )
                                      ]),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.loveM,
                                    margin: EdgeInsets.all(16.h),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
            cardsCount: AppListData.searchPersonList.length,
            controller: controller.swiperController,
          ),
        ),
      ),
    );
  }

  // child: CardSwiper(
  //         backCardOffset: Offset(0, 0), // this is the reference for the swiping
  //         cardBuilder: (context, index, horizontalOffsetPercentage, verticalOffsetPercentage) //this is the callback for the swiping
  //          {
  //           return Padding(
  //             padding: EdgeInsets.only(top: 8.h, right: 24.h, left: 24.h),
  //             child: Container(

  /// Navigates to the homeSearchPartnersSwipeLeftTabContainerScreen when the action is triggered.
  onTapBtnClose() {
    Get.toNamed(
      AppRoutes.homeSearchPartnersSwipeLeftTabContainerScreen,
    );
  }

  // String _generateArtistsText(List<TrackArtist> list) {
  //   String finalString = list.first.name!;

  //   if (list.length >= 2) {
  //     finalString += " (feat. ";
  //     for (int i = 1; i < list.length; i++) {
  //       if (i == 1)
  //         finalString += list[i].name!;
  //       else
  //         finalString += ", ${list[i].name!}";
  //     }
  //     finalString += ")";
  //   }

  //   return finalString;
  // }
}


// delete later, keep for now just in case and apply the swipe logic to the new swipe screen
                                // CustomImageView(
                                //  imagePath:
                                      // AppListData.searchPersonList[index].img,
                                 //  height: 250.h,
                                  // width: double.infinity,
                                 //  radius: BorderRadius.circular(8.h),
                               // ),


// Container(
                        //   height: 299.h,
                        //   width: double.infinity,
                        //   decoration: BoxDecoration(
                        //     gradient: LinearGradient(
                        //         begin: Alignment.topCenter,
                        //         end: Alignment.bottomCenter,
                        //         colors: [
                        //           Colors.transparent,
                        //           Color(0x0),
                        //           Color(0x8A000000)
                        //         ]),
                        //     borderRadius: BorderRadiusStyle.roundedBorder8,
                        //   ),
                        // ),
                        // Positioned(
                        //   right: 8.h,
                        //   top: 8.h,
                        //   child: CircularPercentIndicator(
                        //     radius: 25.h,
                        //     lineWidth: 5.h,
                        //     percent: 0.5,
                        //     circularStrokeCap: CircularStrokeCap.round,
                        //     progressColor: AppColor.primaryColor,
                        //     animation: true,
                        //     backgroundColor: AppColor.white,
                        //     center: Text(
                        //       '92%',
                        //       style: theme.textTheme.labelLarge,
                        //     ),
                        //   ),
                        // ),
                        // Positioned(
                        //     bottom: 8.h,
                        //     left: 5.h,
                        //     child: Text(
                        //       'Liked by 10k+ Others',
                        //       style: CustomTextStyles.bodyLargeWhiteA700,
                        //     )),
                        // Center(
                        //   child: SizedBox(
                        //     height: 280.h,
                        //     width: 280.h,
                        //     child: CardSwiper(
                        //       backCardOffset: Offset(0, 0),
                        //       cardBuilder: (context,
                        //           index,
                        //           horizontalOffsetPercentage,
                        //           verticalOffsetPercentage) {
                        //         print('index---->$index');
                        //         return Stack(
                        //           clipBehavior: Clip.none,
                        //           children: [
                        //             Container(
                        //               height: 250.h,
                        //               width: double.infinity,
                        //               decoration: BoxDecoration(
                        //                 gradient: LinearGradient(
                        //                     begin: Alignment.topCenter,
                        //                     end: Alignment.bottomCenter,
                        //                     colors: [
                        //                       Colors.transparent,
                        //                       Color(0x0),
                        //                       Color(0x8A000000)
                        //                     ]),
                        //                 borderRadius:
                        //                     BorderRadiusStyle.roundedBorder8,
                        //               ),
                        //             ),
                        // Positioned(
                        //   right: 8.h,
                        //   top: 8.h,
                        //   child: CircularPercentIndicator(
                        //     radius: 22.h,
                        //     lineWidth: 3.5.h,
                        //     percent: 0.5,
                        //     circularStrokeCap: CircularStrokeCap.round,
                        //     progressColor: AppColor.primaryColor,
                        //     animation: true,
                        //     backgroundColor: AppColor.white,
                        //     center: Text(
                        //       '50%',
                        //       style: theme.textTheme.labelLarge,
                        //     ),
                        // ),
                        // ),
                        //     Positioned(
                        //         bottom: 8.h,
                        //         left: 5.h,
                        //         child: Text(
                        //           ' ',
                        //           style:
                        //               CustomTextStyles.bodyLargeWhiteA700,
                        //         )),
                        //     index / 2 == 0
                        //         ? Center(
                        //             child: CustomImageView(
                        //               imagePath: ImageConstant.tester,
                        //               height: 56.h,
                        //             ),
                        //           )
                        //         : Center(
                        //             child: CustomImageView(
                        //               imagePath: ImageConstant.tester,
                        //               height: 56.h,
                        //             ),
                        //           )
                        //   ],
                        // );
                        //},
                        //           cardsCount: AppListData.searchPersonList.length,
                        //           controller: controller.swiperController,
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(height: 20),
                        //   ],
                        // ),