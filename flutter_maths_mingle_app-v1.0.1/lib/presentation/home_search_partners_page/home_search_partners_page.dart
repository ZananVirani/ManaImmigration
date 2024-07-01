// ignore_for_file: unnecessary_import

import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_maths_mingle_app/API/api_calls.dart';
import 'package:flutter_maths_mingle_app/API/track.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:flutter_maths_mingle_app/presentation/bottombar_screen/bottombar_screen.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';
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
  HomeSearchPartnersController controller =
      Get.put(HomeSearchPartnersController(HomeSearchPartnersModel().obs));
  late AudioPlayer player;
  late Future<List<Track>> futureList;
  late AnimationController _animationController;
  late Future<Map<String, List<Track>>> tempGenreMap;

  @override
  void initState() {
    MakeAPICall.refreshName();
    futureList = fetchSongs();
    this.player = AudioPlayer();
    player.onPlayerComplete.listen((data) {
      setState(() {
        isPlaying = false;
        _animationController.forward();
      });
    });
    this._animationController = AnimationController(
        value: 1.0, vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  Future<List<Track>> fetchSongs() async {
    var futureList = await MakeAPICall.compileGenres();
    await Future.delayed(Duration(seconds: 2));
    tempGenreMap = PrefData.getAvailableSongs();
    return futureList;
  }

  @override
  Widget build(BuildContext context) {
    return _buildFiftyColumn();
  }

  Widget _buildFiftyColumn() {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/appback.gif'),
                fit: BoxFit.cover,
              )),
            ),
          ),
          centerTitle: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Text(
                    'Welcome back, ' + MakeAPICall.getDisplayName().toString(),
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 27,
                        color: Colors.white, // White background
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Text(
                      'Welcome back, ' +
                          MakeAPICall.getDisplayName().toString(),
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w900,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..color = Colors.black
                                ..strokeWidth = 1.6))),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomBar(player),
        backgroundColor: PrimaryColors().mainColor,
        body: Center(
          child: FutureBuilder(
              future: futureList,
              builder: (context, trackList) {
                if (trackList.hasData) {
                  return FutureBuilder(
                      future: tempGenreMap,
                      builder: (context, anotherTempGenreMap) {
                        if (!anotherTempGenreMap.hasData) {
                          return Text("");
                        } else {
                          Map<String, List<Track>> genreMap =
                              anotherTempGenreMap.data!;
                          Iterable<String> tempGenreKeys = genreMap.keys;
                          List<String> genreKeys = tempGenreKeys.toList();
                          return CardSwiper(
                            isLoop: false,
                            allowedSwipeDirection:
                                AllowedSwipeDirection.symmetric(
                                    horizontal: true, vertical: false),
                            numberOfCardsDisplayed: 1,
                            backCardOffset: Offset(0, 0),
                            cardBuilder: (context,
                                index,
                                horizontalOffsetPercentage,
                                verticalOffsetPercentage) {
                              Track track = trackList.data![index];
                              player.setSource(UrlSource(track.previewUrl!));
                              String allInfo = track.artists!.first.name! +
                                  " - " +
                                  track.album!.name!;
                              return Center(
                                child: ListView(
                                  padding: EdgeInsets.fromLTRB(24, 15, 24, 24),
                                  shrinkWrap: true,
                                  children: [
                                    Container(
                                      height: 575.v,
                                      padding: EdgeInsets.only(
                                          bottom: 24.h,
                                          top: 16.h,
                                          left: 16.h,
                                          right: 16.h),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x11000000),
                                            blurRadius: 16.h,
                                            offset: Offset(0, 5),
                                            spreadRadius: 0,
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder8,
                                        color: PrimaryColors().secondaryColor,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  player.dispose();
                                                  Get.toNamed(AppRoutes
                                                      .createAccountSelectInterestScreen);
                                                  controller.update();
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child: Icon(Icons.settings),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  controller.swiperController
                                                      .undo();
                                                  controller.update();
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child: Icon(Icons.refresh),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Image.network(
                                              track.album!.images!.first.url),
                                          // Stack(
                                          //   clipBehavior: Clip.none,
                                          //   children: [
                                          //     // FutureBuilder(
                                          //     //   future: track,
                                          //     //   builder: (context, trackList) {
                                          //     //     if (trackList.hasData)
                                          //     //       return Image.network(
                                          //     //           width: 400.h,
                                          //     //           trackList.data!.album!.images!.first.url);
                                          //     //     else if (trackList.hasError)
                                          //     //       return CustomImageView(
                                          //     //         imagePath: ImageConstant.travis,
                                          //     //       );
                                          //     //     else
                                          //     //       return const CircularProgressIndicator();
                                          //     //   },
                                          //     // ),

                                          //   ],
                                          // ),

                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              track.name!.length > 28
                                                  ? track.name!
                                                          .substring(0, 26) +
                                                      "..."
                                                  : track.name!,
                                              style: theme.textTheme.bodyLarge!
                                                  .copyWith(
                                                      fontSize: 18.fSize,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: AppColor.black),
                                            ),
                                          ),
                                          Text(
                                            allInfo.length > 39
                                                ? allInfo.substring(0, 37) +
                                                    "..."
                                                : allInfo,
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                          Text(
                                            "Popularity (0-100) : ${track.popularity!}",
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 16.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.swiperController
                                                        .swipe(
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
                                                            color: Color(
                                                                0x11000000),
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
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 30.0),
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      setState(() {
                                                        isPlaying = !isPlaying;

                                                        isPlaying
                                                            ? _animationController
                                                                .reverse()
                                                            : _animationController
                                                                .forward();
                                                      });
                                                      isPlaying
                                                          ? await player
                                                              .resume()
                                                          : await player
                                                              .pause();
                                                    },
                                                    child: Container(
                                                      width: 56.h,
                                                      height: 56.h,
                                                      decoration: BoxDecoration(
                                                          color: PrimaryColors()
                                                              .blueGray500,
                                                          shape:
                                                              BoxShape.circle,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x11000000),
                                                              blurRadius: 16,
                                                              spreadRadius: 0,
                                                            )
                                                          ]),
                                                      child: Center(
                                                        child: AnimatedIcon(
                                                            size: 24.h,
                                                            icon: AnimatedIcons
                                                                .pause_play,
                                                            progress:
                                                                _animationController),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.swiperController
                                                        .swipe(
                                                            CardSwiperDirection
                                                                .right);

                                                    controller.update();
                                                  },
                                                  child: Container(
                                                    width: 56.h,
                                                    height: 56.h,
                                                    decoration: BoxDecoration(
                                                        color: AppColor
                                                            .primaryColor,
                                                        shape: BoxShape.circle,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Color(
                                                                0x11000000),
                                                            blurRadius: 16,
                                                            spreadRadius: 0,
                                                          )
                                                        ]),
                                                    child: CustomImageView(
                                                      imagePath:
                                                          ImageConstant.loveM,
                                                      margin:
                                                          EdgeInsets.all(16.h),
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
                                ),
                              );
                            },
                            onSwipe:
                                (previousIndex, currentIndex, direction) async {
                              if (direction == CardSwiperDirection.right) {
                                await PrefData.addSong(
                                    trackList.data![previousIndex]);
                              }
                              for (int i = 0; i < genreMap.length; i++) {
                                if (genreMap[genreKeys[i]]!
                                    .contains(trackList.data![previousIndex])) {
                                  genreMap[genreKeys[i]]!
                                      .remove(trackList.data![previousIndex]);
                                  await PrefData.setAvailableSongs(genreMap);
                                  break;
                                }
                              }
                              if (currentIndex == null) {
                                player.dispose();
                                Navigator.pushReplacement(
                                    context, _createRoute());
                              }
                              return true;
                            },
                            onUndo: (previousIndex, currentIndex, direction) {
                              PrefData.removeSong(
                                  trackList.data![currentIndex]);
                              return true;
                            },
                            cardsCount: trackList.data!.length,
                            controller: controller.swiperController,
                          );
                        }
                      });
                } else {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: AppColor.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text("Fetching Songs...",
                              style: GoogleFonts.aBeeZee(
                                  color: Colors.white, fontSize: 30.fSize)),
                        )
                      ]);
                  // return Stack(
                  //     alignment: AlignmentDirectional.center,
                  //     children: [
                  //       Opacity(
                  //         opacity: 0.2,
                  //         child: Container(
                  //           color: Colors.black,
                  //           width: double.infinity,
                  //           height: double.infinity,
                  //         ),
                  //       ),
                  //       AlertDialog(
                  //           elevation: 5.0,
                  //           icon: Icon(HeroIcons.magnifying_glass,
                  //               size: 150.adaptSize),
                  //           title: Text("Fetching songs...",
                  //               style: CustomTextStyles.bodyLargeGray700)),
                  //     ]);
                }
              }),
        ),
      ),
    );
  }

  onTapBtnClose() {
    Get.toNamed(
      AppRoutes.homeSearchPartnersSwipeLeftTabContainerScreen,
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          BottomBarScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }
}
