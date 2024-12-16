import 'dart:async';
import 'package:Melofy/presentation/home_search_partners_page/models/custom_drawer.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:Melofy/API/api_calls.dart';
import 'package:Melofy/API/models/track.dart';
import 'package:Melofy/data/pref_data/pref_data.dart';
import 'package:Melofy/widgets/custom_bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import 'controller/home_search_partners_controller.dart';
import 'models/home_search_partners_model.dart';
import 'package:flutter/material.dart';
import 'package:Melofy/core/app_export.dart';

/**
 * Class that displays the home screen, where users can swipe through songs 
 * and like or dislike them.
 */
class HomeSearchPartnersPage extends StatefulWidget {
  const HomeSearchPartnersPage({super.key});

  @override
  State<HomeSearchPartnersPage> createState() => _HomeSearchPartnersPageState();
}

/**
 * State class for the HomeSearchPartnersPage.
 */
class _HomeSearchPartnersPageState extends State<HomeSearchPartnersPage>
    with TickerProviderStateMixin {
  // Variable that tracks if the music is playing or not.
  bool isPlaying = false;
  // Variable that tracks if the artist id is properly assigned so the drawer can pop without error.
  bool drawerCanPop = true;
  // Controller for swiping through songs.
  HomeSearchPartnersController controller =
      Get.put(HomeSearchPartnersController(HomeSearchPartnersModel().obs));
  // Audio player for playing songs.
  late AudioPlayer player;
  // Future that fetches the list of songs from the API.
  late Future<List<Track>?> futureList;
  // Controller for the animation of the play button.
  late AnimationController _animationController;
  // Map that stores the genres and their respective songs.
  late Future<Map<String, List<Track>>> tempGenreMap;
  // String that stores the error message if the API call fails.
  String? errorString;
  // String that stores the artist id for the drawer.
  String? artistID;

  // Keys for the tutorial coach mark upon initial load or when the user clicks
  // the info icon.
  final GlobalKey _likeButtonKey = GlobalKey();
  final GlobalKey _dislikeButtonkey = GlobalKey();
  final GlobalKey _settingsButtonKey = GlobalKey();
  final GlobalKey _playButtonKey = GlobalKey();
  final GlobalKey _undoButtonKey = GlobalKey();
  final GlobalKey _artistButtonKey = GlobalKey();

  /**
   * Function that initializes the state of the HomeSearchPartnersPage.
   */
  @override
  void initState() {
    // Refresh user profile.
    MakeAPICall.refreshName();
    // Fetch the list of songs from the API.
    futureList = fetchSongs();
    // Initialize the audio player.
    this.player = AudioPlayer();
    // Stream that listens for the state of the player, necessary so that
    // the play button can be animated and music can be stopped at proper times.
    player.onPlayerStateChanged.listen((data) {
      if (data == PlayerState.completed || data == PlayerState.stopped) {
        setState(() {
          isPlaying = false;
          _animationController.forward();
        });
      }
    });
    // Initialize the animation controller for the play button.
    this._animationController = AnimationController(
        value: 1.0, vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
    // Show tutorial if it is the first time the user is using the app.
    PrefData.getTutorial().then((value) {
      if (value) {
        PrefData.setTutorial(false);
        _createTutorial(4);
      }
    });
  }

  /**
   * Function that fetches the list of songs from the API.
   */
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

  /**
   * Build the main widget for the HomeSearchPartnersPage.
   */
  @override
  Widget build(BuildContext context) {
    return PopScope(
      // Everytime tries to swipe the page off, it will open the drawer instead.
      canPop: true,
      onPopInvokedWithResult: (didPop, smth) {
        Scaffold.of(context).openDrawer();
      },
      child: SafeArea(
        child: Scaffold(
          // Pass the artistID into CustomDrawer so that the drawer can display the artist's information.
          drawer: CustomDrawer(artistID),
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
                        // Show the tutorial when the user clicks the info icon.
                        onPressed: () async {
                          await _createTutorial(0);
                        },
                        icon: Icon(Icons.info_outlined, size: 26.adaptSize)),
                    GestureDetector(
                      // Navigate to the settings page when the user clicks the settings icon.
                      onTap: () {
                        player.stop();
                        _animationController.stop();
                        Get.offAndToNamed(
                            AppRoutes.createAccountSelectInterestScreen);
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
                  child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: PrimaryColors().melofyColor)),
              Center(
                child: FutureBuilder(
                    future: futureList,
                    builder: (context, trackList) {
                      // Show an error dialog if the API call fails, or if the
                      // user has swiped through all the songs in one of their selected genres.
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
                      // Show the songs if the API call is successful, and there are songs to display.
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

                                // CardSwiper that displays the songs and allows for swiping.
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
                                    // Set all data to current song.
                                    Track track = trackList.data![index];
                                    player.setSource(
                                        UrlSource(track.previewUrl!));
                                    String allInfo =
                                        track.artists!.first.name! +
                                            " - " +
                                            track.album!.name!;

                                    if (drawerCanPop) {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        setState(() {
                                          drawerCanPop = false;
                                        });
                                      });
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        setState(() {
                                          artistID = track.artists!.first.id;
                                        });
                                      });
                                    }
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
                                            padding:
                                                EdgeInsets.all(18.adaptSize),
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
                                                  BorderRadius.circular(
                                                8.h,
                                              ),
                                              color: PrimaryColors().cardColor,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 2),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      IconButton(
                                                          key: _artistButtonKey,
                                                          onPressed: () {
                                                            // Open the drawer to show the artist's information.
                                                            setState(() {
                                                              artistID = track
                                                                  .artists!
                                                                  .first
                                                                  .id;
                                                            });

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
                                                          padding: EdgeInsets
                                                              .all(10.0
                                                                  .adaptSize),
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
                                                    // Check if the user is connected to the internet to display the album cover.
                                                    // If not, display a message to connect to the internet.
                                                    future: Connectivity()
                                                        .checkConnectivity(),
                                                    builder:
                                                        (context, snapshot) {
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
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.33);
                                                    }),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
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
                                                      ? allInfo.substring(
                                                              0, 30) +
                                                          "..."
                                                      : allInfo,
                                                  style: theme
                                                      .textTheme.bodyMedium,
                                                ),
                                                Text(
                                                  "Popularity (0-100) : ${track.popularity!}",
                                                  style: theme
                                                      .textTheme.bodyMedium,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 18.adaptSize),
                                                  child: Row(
                                                    // Row that contains the like, play, and dislike buttons.
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      // Dislike button
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
                                                          key:
                                                              _dislikeButtonkey,
                                                          padding: EdgeInsets
                                                              .all(15.0
                                                                  .adaptSize),
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
                                                                  blurRadius:
                                                                      16,
                                                                  spreadRadius:
                                                                      0,
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
                                                      // Play button
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    32.0),
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
                                                      // Like button
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
                                                          padding:
                                                              EdgeInsets.all(0.0
                                                                  .adaptSize),
                                                          decoration: BoxDecoration(
                                                              color: AppColor
                                                                  .primaryColor,
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
                                    setState(() {
                                      drawerCanPop = true;
                                    });
                                    // Add the song if the song was liked.
                                    if (direction ==
                                        CardSwiperDirection.right) {
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
                                    // If the user has swiped through all the songs, reload the page.
                                    if (currentIndex == null) {
                                      player.dispose();
                                      Get.offAndToNamed(
                                          AppRoutes.homeSearchPartnersPage);
                                    }
                                    return true;
                                  },
                                  // Undo the last action if the user clicks the undo button.
                                  onUndo:
                                      (previousIndex, currentIndex, direction) {
                                    setState(() {
                                      drawerCanPop = true;
                                    });

                                    PrefData.removeSong(
                                        trackList.data![currentIndex]);
                                    return true;
                                  },
                                  cardsCount: trackList.data!.length,
                                  controller: controller.swiperController,
                                );
                              }
                            });
                        // Show a loading spinner with a message if the API call is still in progress.
                      } else {
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                color: AppColor.primaryColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text(
                                  "Fetching Songs...",
                                  style: theme.textTheme.titleLarge!.copyWith(
                                      color: AppColor.primaryColor,
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
      ),
    );
  }

  /**
   * Function that creates the tutorial coach mark for the user.
   */
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
          identify: "artistButton",
          keyTarget: _artistButtonKey,
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
                      'Click here to learn more about the current artist!',
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
      // Show the tutorial coach mark after a delay, depending on if it is initial load or not
      // (if it is not initial load, the delay is 0).
      await Future.delayed(Duration(seconds: delay), () {
        TutorialCoachMark(
          targets: targets,
        )..show(context: context);
      });
    });
  }
}
