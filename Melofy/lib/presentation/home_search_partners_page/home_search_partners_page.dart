import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:Melofy/API/api_calls.dart';
import 'package:Melofy/API/track.dart';
import 'package:Melofy/data/pref_data/pref_data.dart';
import 'package:Melofy/presentation/bottombar_screen/bottombar_screen.dart';
import 'package:Melofy/widgets/custom_bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import 'controller/home_search_partners_controller.dart';
import 'models/home_search_partners_model.dart';
import 'package:flutter/material.dart';
import 'package:Melofy/core/app_export.dart';

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
  late Future<List<Track>?> futureList;
  late AnimationController _animationController;
  late Future<Map<String, List<Track>>> tempGenreMap;
  String? errorString;

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

  Future<List<Track>?> fetchSongs() async {
    try {
      var futureList = await MakeAPICall.compileGenres();
      await Future.delayed(Duration(seconds: 2));
      tempGenreMap = PrefData.getAvailableSongs();
      return futureList;
    } catch (e) {
      if (e is String) {
        setState(() {
          errorString = e;
        });
      }
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildFiftyColumn();
  }

  Widget _buildFiftyColumn() {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.v,
          flexibleSpace: FlexibleSpaceBar(
            background: Opacity(
              opacity: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: PrimaryColors().tertiaryColor,
                ),
              ),
            ),
          ),
          centerTitle: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Find the rhythm of your soul".capitalize!,
                style: theme.textTheme.titleLarge!.copyWith(
                    color: AppColor.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 22.fSize,
                    letterSpacing: 0,
                    wordSpacing: -2),
              )
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomBar(player),
        body: Stack(
          children: [
            Center(
              child: Opacity(
                opacity: .92,
                child: Container(
                    height: MediaQuery.sizeOf(context).height,
                    child: CustomImageView(
                      imagePath: ImageConstant.background,
                    )),
              ),
            ),
            Center(
              child: FutureBuilder(
                  future: futureList,
                  builder: (context, trackList) {
                    if (errorString != null) {
                      return Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Opacity(
                              opacity: 0.2,
                              child: Container(
                                color: Colors.black,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            AlertDialog(
                              elevation: 5.0,
                              icon: Icon(HeroIcons.magnifying_glass,
                                  size: 120.adaptSize),
                              title: Text(
                                  "You have reached the end of the following genres:",
                                  style: CustomTextStyles.bodyLargeGray700),
                              content: Text(
                                errorString!,
                                style: CustomTextStyles.bodyMediumBlack600,
                                textAlign: TextAlign.center,
                              ),
                              actions: [
                                GestureDetector(
                                  child: Center(
                                      child: Text(
                                    "Go to Interests Screen",
                                    style: GoogleFonts.bonaNova(
                                        decoration: TextDecoration.underline,
                                        fontSize: 18.fSize,
                                        backgroundColor: AppColor.lightGray,
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  onTap: () {
                                    Get.offAndToNamed(AppRoutes
                                        .createAccountSelectInterestScreen);
                                  },
                                )
                              ],
                            ),
                          ]);
                    }
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
                                  player
                                      .setSource(UrlSource(track.previewUrl!));
                                  String allInfo = track.artists!.first.name! +
                                      " - " +
                                      track.album!.name!;
                                  return Center(
                                    child: ListView(
                                      padding:
                                          EdgeInsets.fromLTRB(24, 15, 24, 24),
                                      shrinkWrap: true,
                                      children: [
                                        Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              .65,
                                          padding: EdgeInsets.all(18.adaptSize),
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x11000000),
                                                blurRadius: 16.h,
                                                offset: Offset(0, 5),
                                                spreadRadius: 0,
                                              ),
                                            ],
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8,
                                            color:
                                                PrimaryColors().secondaryColor,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 2),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        player.dispose();
                                                        Get.toNamed(AppRoutes
                                                            .createAccountSelectInterestScreen);
                                                        controller.update();
                                                      },
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0.adaptSize),
                                                        child: Icon(
                                                            Icons.settings),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        controller
                                                            .swiperController
                                                            .undo();
                                                        controller.update();
                                                      },
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0.adaptSize),
                                                        child:
                                                            Icon(Icons.refresh),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              FutureBuilder(
                                                  future: Connectivity()
                                                      .checkConnectivity(),
                                                  builder: (context, snapshot) {
                                                    if (!snapshot.hasData)
                                                      return Text("",
                                                          style: CustomTextStyles
                                                              .titleLargeffd97bca);
                                                    else
                                                      return snapshot.data!
                                                              .contains(
                                                                  ConnectivityResult
                                                                      .none)
                                                          ? Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left:
                                                                          8.0),
                                                              child: SizedBox(
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.33,
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    .55,
                                                                child: Center(
                                                                  child: Text(
                                                                      "Please connect to the internet for picture and audio.",
                                                                      style: CustomTextStyles
                                                                          .titleLargeffd97bca),
                                                                ),
                                                              ),
                                                            )
                                                          : Image.network(
                                                              track
                                                                  .album!
                                                                  .images!
                                                                  .first
                                                                  .url,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.33);
                                                  }),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: Text(
                                                  track.name!.length > 25
                                                      ? track.name!.substring(
                                                              0, 23) +
                                                          "..."
                                                      : track.name!,
                                                  style: theme
                                                      .textTheme.bodyLarge!
                                                      .copyWith(
                                                          fontSize: 18.fSize,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color:
                                                              AppColor.black),
                                                ),
                                              ),
                                              Text(
                                                allInfo.length > 32
                                                    ? allInfo.substring(0, 30) +
                                                        "..."
                                                    : allInfo,
                                                style:
                                                    theme.textTheme.bodyMedium,
                                              ),
                                              Text(
                                                "Popularity (0-100) : ${track.popularity!}",
                                                style:
                                                    theme.textTheme.bodyMedium,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 18.adaptSize),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        controller
                                                            .swiperController
                                                            .swipe(
                                                          CardSwiperDirection
                                                              .left,
                                                        );
                                                        controller.update();
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(
                                                            15.0.adaptSize),
                                                        decoration:
                                                            BoxDecoration(
                                                                color: AppColor
                                                                    .white,
                                                                shape: BoxShape
                                                                    .circle,
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
                                                          size: MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.035,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 32.0),
                                                      child: GestureDetector(
                                                        onTap: () async {
                                                          setState(() {
                                                            isPlaying =
                                                                !isPlaying;

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
                                                          padding: EdgeInsets
                                                              .all(15.0
                                                                  .adaptSize),
                                                          decoration: BoxDecoration(
                                                              color: PrimaryColors()
                                                                  .blueGray500,
                                                              shape: BoxShape
                                                                  .circle,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Color(
                                                                      0x11000000),
                                                                  blurRadius:
                                                                      16,
                                                                  spreadRadius:
                                                                      0,
                                                                )
                                                              ]),
                                                          child: Center(
                                                            child: AnimatedIcon(
                                                                size: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.035,
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
                                                        controller
                                                            .swiperController
                                                            .swipe(
                                                                CardSwiperDirection
                                                                    .right);

                                                        controller.update();
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(
                                                            18.5.adaptSize),
                                                        decoration: BoxDecoration(
                                                            color: AppColor
                                                                .primaryColor,
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
                                                        child: CustomImageView(
                                                            imagePath:
                                                                ImageConstant
                                                                    .loveM,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.03),
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
                                onSwipe: (previousIndex, currentIndex,
                                    direction) async {
                                  if (direction == CardSwiperDirection.right) {
                                    await PrefData.addSong(
                                        trackList.data![previousIndex]);
                                  }
                                  for (int i = 0; i < genreMap.length; i++) {
                                    if (genreMap[genreKeys[i]]!.contains(
                                        trackList.data![previousIndex])) {
                                      genreMap[genreKeys[i]]!.remove(
                                          trackList.data![previousIndex]);
                                      await PrefData.setAvailableSongs(
                                          genreMap);
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
                                onUndo:
                                    (previousIndex, currentIndex, direction) {
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
                              child: Text(
                                "Fetching Songs...",
                                style: theme.textTheme.titleLarge!.copyWith(
                                    color: AppColor.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 33.fSize),
                              ),
                            )
                          ]);
                    }
                  }),
            ),
          ],
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
