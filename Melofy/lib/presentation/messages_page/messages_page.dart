import 'package:Melofy/API/models/playlist_search.dart' as playlistTrack;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:Melofy/API/api_calls.dart';
import 'package:Melofy/API/models/track.dart';
import 'package:Melofy/data/pref_data/pref_data.dart';
import 'package:Melofy/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:Melofy/core/app_export.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  bool checkAll = true;
  bool showMessage = false;
  List<Track>? exportList;
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    AudioPlayer _player = arguments as AudioPlayer;
    Future<List<Track>?> futureList = PrefData.getMusicList();

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomBar(_player),
        body: FutureBuilder(
            future: futureList,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(""),
                );
              } else if (snapshot.hasData) {
                List<Track> likedList = snapshot.data!;
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 24.h, right: 24.h, top: 20.h, bottom: 20.h),
                        decoration: BoxDecoration(
                            color: PrimaryColors().tertiaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x11000000),
                                blurRadius: 12.h,
                                offset: Offset(0, 5),
                                spreadRadius: 0,
                              )
                            ]),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                PrefData.currentIndex = 0;
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 20.h),
                                height: 30.h,
                                width: 30.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.lightGray,
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: AppColor.black,
                                  size: 16.h,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                'My Liked Songs',
                                style: theme.textTheme.titleLarge!.copyWith(
                                  color: AppColor.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 26.fSize,
                                  letterSpacing: 0,
                                  wordSpacing: -2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      _buildSubMenu(likedList, _player),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          primary: true,
                          padding: EdgeInsets.zero,
                          itemCount: likedList.length,
                          itemBuilder: (context, index) {
                            bool isChecked = checkAll;
                            Track track = likedList[index];

                            return StatefulBuilder(
                                builder: (context, setState) {
                              return Column(
                                children: [
                                  ListTile(
                                    leading: Checkbox(
                                        activeColor: AppColor.primaryColor,
                                        value: isChecked,
                                        tristate: false,
                                        onChanged: (newBool) {
                                          setState(() {
                                            isChecked = !isChecked;
                                            if (exportList == null)
                                              exportList = List.from(likedList);
                                            isChecked
                                                ? exportList!.add(track)
                                                : exportList!.remove(track);
                                          });
                                        }),
                                    title: Text(track.name!.length > 20
                                        ? track.name!.substring(0, 21) + "..."
                                        : track.name!),
                                    subtitle: Text(track.artists!.first.name!),
                                    trailing: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            side: WidgetStateBorderSide
                                                .resolveWith((Set) {
                                              return BorderSide(
                                                  color: AppColor.primaryColor);
                                            }),
                                            backgroundColor:
                                                WidgetStateColor.resolveWith(
                                                    (Set) {
                                              return AppColor.white;
                                            }),
                                            iconColor:
                                                WidgetStateColor.resolveWith(
                                                    (Set) {
                                              return AppColor.primaryColor;
                                            }),
                                          ),
                                          child: Icon(Icons.music_note,
                                              size: 26.adaptSize),
                                          onPressed: () async {
                                            await _player.setSource(
                                                UrlSource(track.previewUrl!));
                                            await _player.resume();
                                          },
                                        )),
                                  ),
                                  Container(
                                      width: double.infinity,
                                      height: 2.0,
                                      color: Colors.black12),
                                ],
                              );
                            });
                          },
                        ),
                      )
                    ]);
              } else {
                return CircularProgressIndicator(color: AppColor.primaryColor);
              }
            }),
      ),
    );
  }

  Widget _buildSubMenu(List<Track> likedList, AudioPlayer player) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: AppColor.black, width: 0.8))),
      width: double.infinity,
      height: 45.v,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8.0),
          child: GestureDetector(
              onTap: () {
                setState(() {
                  exportList = List.from(likedList);
                });
                setState(() {
                  checkAll = true;
                });
              },
              child: Text("Select All",
                  style: theme.textTheme.titleSmall!.copyWith(
                      color: AppColor.black,
                      wordSpacing: -2,
                      fontSize: 14.fSize))),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 7.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                exportList = [];
              });
              setState(() {
                checkAll = false;
              });
            },
            child: Text("Deselect All",
                style: theme.textTheme.titleSmall!.copyWith(
                    color: AppColor.black,
                    wordSpacing: -2,
                    fontSize: 14.fSize)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.5),
          child: GestureDetector(
            onTap: () async {
              await showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                      title: Text("Clear Song List?"),
                      actions: [
                        CupertinoDialogAction(
                          child: Text("Cancel"),
                          onPressed: () => Navigator.pop(context),
                        ),
                        CupertinoDialogAction(
                            child: Text("Clear"),
                            onPressed: () async {
                              Navigator.pop(context);
                              PrefData.setMusicList([]);
                              setState(() {
                                exportList = [];
                              });
                              player.stop();
                            })
                      ]);
                },
              );
            },
            child: Text("Clear",
                style: theme.textTheme.titleSmall!.copyWith(
                    color: AppColor.black,
                    wordSpacing: -2,
                    fontSize: 15.fSize)),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                  onTap: () async {
                    if (exportList == null) exportList = List.from(likedList);
                    final playlists = await MakeAPICall.getPlaylists();
                    int i = 0;
                    var dropdownlist = playlists.map((element) {
                      return DropdownMenuEntry(
                          value: i++,
                          label: element.name!,
                          style: ButtonStyle(
                            side: WidgetStateProperty.resolveWith((Set) {
                              return BorderSide(
                                  color: PrimaryColors().tertiaryColor,
                                  width: 0.7);
                            }),
                          ));
                    }).toList();
                    await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: AppColor.lightGray,
                            title: Text(
                              "Select a playlist for export...",
                              style: theme.textTheme.titleMedium!.copyWith(
                                color: AppColor.black,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            content: FutureBuilder(
                                future: PrefData.getPrefPlaylist(),
                                builder: (context, snapshot) {
                                  return SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * .9,
                                    child: DropdownMenu(
                                      textStyle:
                                          theme.textTheme.titleSmall!.copyWith(
                                        color: AppColor.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      enableSearch: false,
                                      menuStyle: MenuStyle(fixedSize:
                                          WidgetStateProperty.resolveWith(
                                              (Set) {
                                        return Size(
                                            4,
                                            MediaQuery.sizeOf(context).height *
                                                0.3);
                                      }), backgroundColor:
                                          WidgetStateProperty.resolveWith(
                                              (Set) {
                                        return AppColor.lightGray;
                                      })),
                                      width:
                                          MediaQuery.sizeOf(context).width * .7,
                                      initialSelection: findInPlaylists(
                                          snapshot.data, playlists),
                                      dropdownMenuEntries: dropdownlist,
                                      onSelected: (value) async {
                                        await PrefData.setPrefPlaylist(
                                            playlists[value!].id!);
                                      },
                                    ),
                                  );
                                }),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12.0),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          await showDialog(
                                            barrierColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              TextEditingController
                                                  textController =
                                                  TextEditingController();

                                              return AlertDialog(
                                                backgroundColor:
                                                    AppColor.lightGray,
                                                title: Text(
                                                  "Name of Playlist",
                                                  style: theme
                                                      .textTheme.titleMedium!
                                                      .copyWith(
                                                    color: AppColor.black,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                                content: SizedBox(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          .9,
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            "Type here..."),
                                                    controller: textController,
                                                    style: theme
                                                        .textTheme.titleSmall!
                                                        .copyWith(
                                                      color: AppColor.black,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                actions: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 19.0),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .bottomLeft,
                                                          child: ElevatedButton(
                                                            onPressed:
                                                                () async {
                                                              textController
                                                                  .text = "";
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                              "Cancel",
                                                              style: theme
                                                                  .textTheme
                                                                  .titleSmall!
                                                                  .copyWith(
                                                                color: AppColor
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                            style: ButtonStyle(backgroundColor:
                                                                WidgetStateColor
                                                                    .resolveWith(
                                                                        (Set) {
                                                              return AppColor
                                                                  .white; //Color.fromARGB(255, 143, 225, 215);
                                                            }), fixedSize:
                                                                WidgetStateProperty
                                                                    .resolveWith(
                                                                        (Set) {
                                                              return Size(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      .35,
                                                                  4);
                                                            }), side:
                                                                WidgetStateProperty
                                                                    .resolveWith(
                                                                        (Set) {
                                                              return BorderSide(
                                                                  width: 0.5);
                                                            })),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 19.0),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .bottomRight,
                                                          child: ElevatedButton(
                                                            onPressed:
                                                                () async {
                                                              if (textController
                                                                      .text ==
                                                                  "") {
                                                                await showCupertinoDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return CupertinoAlertDialog(
                                                                      title: Text(
                                                                          "Please enter a name."),
                                                                      actions: [
                                                                        CupertinoDialogAction(
                                                                          child:
                                                                              Text("Ok"),
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                        )
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              } else {
                                                                var connectionList =
                                                                    await Connectivity()
                                                                        .checkConnectivity();

                                                                if (!connectionList
                                                                    .contains(
                                                                        ConnectivityResult
                                                                            .none)) {
                                                                  String
                                                                      playlistID =
                                                                      await MakeAPICall.createPlaylist(
                                                                          textController
                                                                              .text);

                                                                  if (exportList!
                                                                          .length ==
                                                                      likedList
                                                                          .length) {
                                                                    await MakeAPICall.addSongsToPlaylist(
                                                                        exportList!,
                                                                        playlistID);
                                                                    await PrefData
                                                                        .setPrefPlaylist(
                                                                            playlistID);
                                                                    PrefData
                                                                        .setMusicList(
                                                                            []);
                                                                    setState(
                                                                        () {
                                                                      exportList =
                                                                          [];
                                                                      checkAll =
                                                                          false;
                                                                    });
                                                                  } else {
                                                                    MakeAPICall.addSongsToPlaylist(
                                                                        exportList!,
                                                                        playlistID);
                                                                    for (Track track
                                                                        in exportList!) {
                                                                      likedList
                                                                          .remove(
                                                                              track);
                                                                    }
                                                                    PrefData.setMusicList(
                                                                        likedList);
                                                                    setState(
                                                                        () {
                                                                      exportList =
                                                                          [];
                                                                      checkAll =
                                                                          false;
                                                                    });
                                                                  }
                                                                  player.stop();
                                                                  Navigator.pop(
                                                                      context);
                                                                  Navigator.pop(
                                                                      context);
                                                                } else {
                                                                  player.stop();
                                                                  Navigator.pop(
                                                                      context);
                                                                  await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return AlertDialog(
                                                                          elevation:
                                                                              5.0,
                                                                          icon: Icon(
                                                                              Icons.wifi_off,
                                                                              size: 120.adaptSize,
                                                                              color: AppColor.secondaryLightColor),
                                                                          title: Text(
                                                                              "Uh oh! Something went wrong!",
                                                                              style: CustomTextStyles.bodyLargeGray700),
                                                                          content:
                                                                              Text(
                                                                            "Please check your network connection and try again.",
                                                                            style:
                                                                                CustomTextStyles.bodyMediumBlack600,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                          actions: [
                                                                            GestureDetector(
                                                                              child: Center(
                                                                                  child: Text(
                                                                                "Ok",
                                                                                style: TextStyle(fontSize: 18.fSize, backgroundColor: AppColor.lightGray, color: AppColor.primaryColor, fontWeight: FontWeight.bold),
                                                                              )),
                                                                              onTap: () {
                                                                                Navigator.pop(context);
                                                                              },
                                                                            )
                                                                          ],
                                                                        );
                                                                      });
                                                                }
                                                              }
                                                            },
                                                            child: Text(
                                                              "Export",
                                                              style: theme
                                                                  .textTheme
                                                                  .titleSmall!
                                                                  .copyWith(
                                                                color: AppColor
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                            style: ButtonStyle(backgroundColor:
                                                                WidgetStateColor
                                                                    .resolveWith(
                                                                        (Set) {
                                                              return PrimaryColors()
                                                                  .tertiaryColor; //Color.fromARGB(255, 143, 225, 215);
                                                            }), fixedSize:
                                                                WidgetStateProperty
                                                                    .resolveWith(
                                                                        (Set) {
                                                              return Size(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      .3,
                                                                  4);
                                                            }), side:
                                                                WidgetStateProperty
                                                                    .resolveWith(
                                                                        (Set) {
                                                              return BorderSide(
                                                                  width: 0.5);
                                                            })),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Text(
                                          "New Playlist",
                                          style: theme.textTheme.titleSmall!
                                              .copyWith(
                                            color: AppColor.black,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        style: ButtonStyle(backgroundColor:
                                            WidgetStateColor.resolveWith((Set) {
                                          return AppColor
                                              .white; //Color.fromARGB(255, 143, 225, 215);
                                        }), fixedSize:
                                            WidgetStateProperty.resolveWith(
                                                (Set) {
                                          return Size(
                                              MediaQuery.sizeOf(context).width *
                                                  .4,
                                              4);
                                        }), side:
                                            WidgetStateProperty.resolveWith(
                                                (Set) {
                                          return BorderSide(width: 0.5);
                                        })),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12.0),
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          var connectionList =
                                              await Connectivity()
                                                  .checkConnectivity();

                                          if (!connectionList.contains(
                                              ConnectivityResult.none)) {
                                            String? playlistID = await PrefData
                                                .getPrefPlaylist();

                                            if (playlistID == null)
                                              playlistID = playlists[0].id!;

                                            if (exportList!.length ==
                                                likedList.length) {
                                              await MakeAPICall
                                                  .addSongsToPlaylist(
                                                      exportList!, playlistID);
                                              PrefData.setMusicList([]);
                                              setState(() {
                                                exportList = [];
                                                checkAll = false;
                                              });
                                            } else {
                                              MakeAPICall.addSongsToPlaylist(
                                                  exportList!, playlistID);
                                              for (Track track in exportList!) {
                                                likedList.remove(track);
                                              }
                                              PrefData.setMusicList(likedList);
                                              setState(() {
                                                exportList = [];
                                                checkAll = false;
                                              });
                                            }
                                            player.stop();
                                            Navigator.pop(context);
                                          } else {
                                            player.stop();
                                            Navigator.pop(context);
                                            await showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    elevation: 5.0,
                                                    icon: Icon(Icons.wifi_off,
                                                        size: 120.adaptSize,
                                                        color: AppColor
                                                            .secondaryLightColor),
                                                    title: Text(
                                                        "Uh oh! Something went wrong!",
                                                        style: CustomTextStyles
                                                            .bodyLargeGray700),
                                                    content: Text(
                                                      "Please check your network connection and try again.",
                                                      style: CustomTextStyles
                                                          .bodyMediumBlack600,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    actions: [
                                                      GestureDetector(
                                                        child: Center(
                                                            child: Text(
                                                          "Ok",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  18.fSize,
                                                              backgroundColor:
                                                                  AppColor
                                                                      .lightGray,
                                                              color: AppColor
                                                                  .primaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      )
                                                    ],
                                                  );
                                                });
                                          }
                                        },
                                        child: Text(
                                          "Export",
                                          style: theme.textTheme.titleSmall!
                                              .copyWith(
                                            color: AppColor.black,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        style: ButtonStyle(backgroundColor:
                                            WidgetStateColor.resolveWith((Set) {
                                          return PrimaryColors()
                                              .tertiaryColor; //Color.fromARGB(255, 143, 225, 215);
                                        }), fixedSize:
                                            WidgetStateProperty.resolveWith(
                                                (Set) {
                                          return Size(
                                              MediaQuery.sizeOf(context).width *
                                                  .25,
                                              4);
                                        }), side:
                                            WidgetStateProperty.resolveWith(
                                                (Set) {
                                          return BorderSide(width: 0.5);
                                        })),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        });
                  },
                  child: Text("Export to Spotify",
                      style: theme.textTheme.titleSmall!.copyWith(
                        color: AppColor.black,
                        wordSpacing: 0.0,
                      )),
                )),
          ),
        ),
      ]),
    );
  }

  int findInPlaylists(String? playlistID, List<playlistTrack.Item> playlists) {
    if (playlistID == null) return 0;

    for (int i = 0; i < playlists.length; i++) {
      if (playlists[i].id == playlistID) return i;
    }

    PrefData.setPrefPlaylist("null");

    return 0;
  }
}
