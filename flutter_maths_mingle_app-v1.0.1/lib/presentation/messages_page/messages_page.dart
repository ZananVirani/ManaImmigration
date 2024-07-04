// ignore_for_file: unnecessary_import

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_maths_mingle_app/API/api_calls.dart';
import 'package:flutter_maths_mingle_app/API/track.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_bottom_bar.dart';
import 'package:pinput/pinput.dart';
import 'controller/messages_controller.dart';

import 'models/messages_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

class MessagesPage extends StatefulWidget {
  // Add List of songs
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  MessagesController controller =
      Get.put(MessagesController(MessagesModel().obs));

  bool checkAll = true;
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
                print("THERE IS AN ERRROROROORORORORORO!!!");
                print(snapshot.error);
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
                            left: 24.h, right: 24.h, top: 40.h, bottom: 25.h),
                        decoration: BoxDecoration(
                            color: PrimaryColors().secondaryColor,
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
                                // CommonPop.popScreen(context, RoutesPath.loginScreen);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 20.h),
                                height: 35.h,
                                width: 35.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.lightGray,
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: AppColor.black,
                                  size: 18.h,
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
                                            await _player.play(
                                                UrlSource(track.previewUrl!));
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
                  print(exportList);
                  exportList = List.from(likedList);
                  print(exportList);
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
                              PrefData.setMusicList([]);
                              setState(() {
                                exportList = [];
                              });
                              Navigator.pop(context);
                            }
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return BottomBarScreen();}
                            )
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
                  await showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                          title: Text("Are you happy with your selections?"),
                          content:
                              Text("Selected songs will be added to playlist."),
                          actions: [
                            CupertinoDialogAction(
                              child: Text("Cancel"),
                              onPressed: () => Navigator.pop(context),
                            ),
                            CupertinoDialogAction(
                                child: Text("Export"),
                                onPressed: () async {
                                  if (exportList!.length == likedList.length) {
                                    await MakeAPICall.addSongsToPlaylist(
                                        exportList!);
                                    PrefData.setMusicList([]);
                                    setState(() {
                                      exportList = [];
                                    });
                                  } else {
                                    MakeAPICall.addSongsToPlaylist(exportList!);
                                    for (Track track in exportList!) {
                                      print(likedList.length);
                                      likedList.remove(track);
                                    }
                                    PrefData.setMusicList(likedList);
                                    setState(() {
                                      exportList = [];
                                    });
                                  }
                                  Navigator.pop(context);
                                }
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) {
                                //   return BottomBarScreen();}
                                )
                          ]);
                    },
                  );
                },
                child: Text("Export to Spotify",
                    style: theme.textTheme.titleSmall!.copyWith(
                      color: AppColor.black,
                      wordSpacing: 0.0,
                    )),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

  /// Row of profile pictures
  // Widget _buildFrame() {
  //   return SizedBox(
  //       height: 107.h,
  //       child: Obx(() => GridView.builder(
  //           padding: EdgeInsets.only(
  //               top: 16.h, bottom: 24.h, right: 24.h, left: 24.h),
  //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             mainAxisExtent: 67.h,
  //             crossAxisCount: 4,
  //             crossAxisSpacing: 20.h,
  //           ),
  //           itemCount:
  //               controller.messagesModelObj.value.frameItemList.value.length,
  //           itemBuilder: (context, index) {
  //             FrameItemModel model =
  //                 controller.messagesModelObj.value.frameItemList.value[index];
  //             return FrameItemWidget(model);
  //           })));
  // }

  /// Chats Logs
  // Widget _buildChatComponent() {
  //   return Obx(() => ListView.separated(
  //       padding: EdgeInsets.only(bottom: 50.h, left: 24.h, right: 24.h),
  //       physics: BouncingScrollPhysics(),
  //       shrinkWrap: true,
  //       separatorBuilder: (context, index) {
  //         return SizedBox(height: 16.h);
  //       },
  //       itemCount: controller
  //           .messagesModelObj.value.chatcomponentItemList.value.length,
  //       itemBuilder: (context, index) {
  //         ChatcomponentItemModel model = controller
  //             .messagesModelObj.value.chatcomponentItemList.value[index];
  //         return ChatcomponentItemWidget(model, onTapChatComponent: () {
  //           onTapChatComponent();
  //         });
  //       }));
  // }

  /// Navigates to the firstTimeChatScreen when the action is triggered.
  /// 
  ///    onTapChatComponent() {
    //   controller.isFirstChat
    //       ? Get.toNamed(AppRoutes.firstTimeChatScreen)
    //       : Get.toNamed(AppRoutes.firstTimeChatOneScreen);
    // }

    // /// Navigates to the previous screen.
    // onTapArrowLeft() {
    //   Get.back();
    // }

