import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:Melofy/API/api_calls.dart';
import 'package:Melofy/API/track.dart';
import 'package:Melofy/data/pref_data/pref_data.dart';
import 'package:Melofy/presentation/bottombar_screen/bottombar_screen.dart';
import 'package:Melofy/widgets/custom_bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

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

  final GlobalKey _likeButtonKey = GlobalKey();
  final GlobalKey _dislikeButtonkey = GlobalKey();
  final GlobalKey _settingsButtonKey = GlobalKey();
  final GlobalKey _playButtonKey = GlobalKey();
  final GlobalKey _undoButtonKey = GlobalKey();

  @override
  void initState() {
    MakeAPICall.refreshName();
    futureList = fetchSongs();
    this.player = AudioPlayer();
    player.onPlayerStateChanged.listen((data) {
      if (data == PlayerState.completed || data == PlayerState.stopped) {
        setState(() {
          isPlaying = false;
          _animationController.forward();
        });
      }
    });
    this._animationController = AnimationController(
        value: 1.0, vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
    PrefData.getTutorial().then((value) {
      if (value) {
        PrefData.setTutorial(false);
        _createTutorial(4);
      }
    });
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
        drawer: Drawer(child: Center(child: Text("Opened"))),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70.v,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Melofy",
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: AppColor.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 28.fSize,
                    letterSpacing: 0,
                    wordSpacing: -2,
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        await _createTutorial(0);
                      },
                      icon: Icon(Icons.info_outlined, size: 26.adaptSize)),
                  GestureDetector(
                    onTap: () {
                      player.stop();
                      _animationController.stop();
                      Get.toNamed(AppRoutes.createAccountSelectInterestScreen);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10.0.adaptSize),
                      child: Icon(
                          size: 26.adaptSize,
                          key: _settingsButtonKey, // tutorial for setting
                          Icons.settings),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomBar(player),
        body: Stack(
          children: [
            Center(
                // child: Opacity(
                //   opacity: .92,
                //   child: Container(
                //       height: MediaQuery.sizeOf(context).height,
                //       child: CustomImageView(
                //         imagePath: ImageConstant.background,
                //       )),
                // ),
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: PrimaryColors().melofyColor)),
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
                                      physics: NeverScrollableScrollPhysics(),
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
                                            color: PrimaryColors().cardColor,
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
                                                    IconButton(
                                                        onPressed: () {
                                                          Scaffold.of(context)
                                                              .openDrawer();
                                                        },
                                                        icon: const Icon(
                                                            Icons.face)),
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
                                                        child: Icon(
                                                          Icons.refresh,
                                                          key: _undoButtonKey,
                                                        ),
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
                                                        key: _dislikeButtonkey,
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
                                                          key: _playButtonKey,
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
                                                        key: _likeButtonKey,
                                                        padding: EdgeInsets.all(
                                                            0.0.adaptSize),
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
                                                                0.075),
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

  Future<void> _createTutorial(int delay) async {
    await Future.delayed(Duration(seconds: 0), () async {
      final targets = [
        TargetFocus(
          identify: "settingsButton",
          keyTarget: _settingsButtonKey,
          alignSkip: Alignment.topCenter,
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              builder: (context, controller) => Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                      color: Color.fromARGB(255, 118, 224, 32), width: 3.0),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text(
                      'Want to change genres? Click here to select other genres',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.next();
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Continue ',
                                  style: TextStyle(color: Colors.white)),
                              Icon(Icons.arrow_circle_right,
                                  color: Colors.white),
                            ]),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 15, 95, 1)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        TargetFocus(
          identify: "undoButton",
          keyTarget: _undoButtonKey,
          alignSkip: Alignment.topCenter,
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              builder: (context, controller) => Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                      color: Color.fromARGB(255, 118, 224, 32), width: 3.0),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text(
                      'Click here to undo your most recent action!',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.next();
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Continue ',
                                  style: TextStyle(color: Colors.white)),
                              Icon(Icons.arrow_circle_right,
                                  color: Colors.white),
                            ]),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 15, 95, 1)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        TargetFocus(
          identify: "likeButton",
          keyTarget: _likeButtonKey,
          alignSkip: Alignment.topCenter,
          contents: [
            TargetContent(
              align: ContentAlign.top,
              builder: (context, controller) => Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                      color: Color.fromARGB(255, 118, 224, 32), width: 3.0),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text(
                      'Add the songs you like by clicking here!',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.next();
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Continue ',
                                  style: TextStyle(color: Colors.white)),
                              Icon(Icons.arrow_circle_right,
                                  color: Colors.white),
                            ]),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 15, 95, 1)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        TargetFocus(
          identify: "dislikeButton",
          keyTarget: _dislikeButtonkey,
          alignSkip: Alignment.topCenter,
          contents: [
            TargetContent(
              align: ContentAlign.top,
              builder: (context, controller) => Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                      color: Color.fromARGB(255, 118, 224, 32), width: 3.0),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text(
                      "Click here if you don't like this song!",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.next();
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Continue ',
                                  style: TextStyle(color: Colors.white)),
                              Icon(Icons.arrow_circle_right,
                                  color: Colors.white),
                            ]),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 15, 95, 1)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        TargetFocus(
          identify: "playButton",
          keyTarget: _playButtonKey,
          alignSkip: Alignment.topCenter,
          contents: [
            TargetContent(
              align: ContentAlign.top,
              builder: (context, controller) => Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                      color: Color.fromARGB(255, 118, 224, 32), width: 3.0),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text(
                      'Click here to preview the current song!',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.next();
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Continue ',
                                  style: TextStyle(color: Colors.white)),
                              Icon(Icons.arrow_circle_right,
                                  color: Colors.white),
                            ]),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 15, 95, 1)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ];
      await Future.delayed(Duration(seconds: delay), () {
        final tutorial = TutorialCoachMark(
          targets: targets,
        )..show(context: context);
      });
    });
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
