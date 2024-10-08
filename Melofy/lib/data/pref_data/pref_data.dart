import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Melofy/API/models/track.dart';
import 'package:Melofy/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:oauth2_client/access_token_response.dart';

class PrefData {
  static String prefName = "com.fluttermathsmingleapp.app";
  static SharedPreferences? _sharedPreferences;

  PrefData() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  Future<SharedPreferences> get getPref async {
    return _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  static Future<void> clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  static String keyCart = 'cardList';
  static String fevCart = 'favList';
  static String isIntro = 'intro';
  static String isLoc = 'Location';
  static String isProfilePic = 'ProfilePic';
  static String isSubProfile = 'SubProfilePic';
  static String isLogin = 'login';
  static String isInfo = 'info';
  static String isNotify = 'notification';
  static String isDakMode = '${prefName}darkMode';
  static String isClickMic = '${prefName}ClickMic';
  static String isClickKeyboard = '${prefName}ClickKeyboard';
  static String isMatched = '${prefName}isMatched';
  static String chatFirstTime = '${prefName}firstTimeChat';

  static setIntro(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isIntro, value);
  }

  static Future<bool> getIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isIntro) ?? true;
  }

  static setTutorial(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('tutorial', value);
  }

  static Future<bool> getTutorial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('tutorial') ?? true;
  }

  static setLogin(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isLogin, value);
  }

  static Future<bool> getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLogin) ?? true;
  }

  static Future<void> setUserID(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userID', id);
  }

  static Future<String?> getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('userID');

    return id;
  }

  static Future<void> setUserCountry(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userCountry', id);
  }

  static Future<String> getUserCountry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('userCountry') ?? "CA";

    return id;
  }

  static Future<void> addSong(Track track) async {
    getMusicList().then((list) {
      list!.add(track);
      setMusicList(list);
    });
  }

  static void removeSong(Track track) async {
    getMusicList().then((list) {
      list!.remove(track);
      setMusicList(list);
    });
  }

  static setMusicList(List<Track> trackList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String trackListJSON = json.encode(trackList);
    prefs.setString('trackList', trackListJSON);
  }

  static Future<List<Track>?> getMusicList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('trackList') ?? '[]';

    List<dynamic> trackListString = json.decode(id);
    Iterable<Track> trackList = trackListString.map((track) {
      return Track.fromJson(track);
    });

    Set<Track> setList = trackList.toSet();
    return setList.toList();
  }

  static Future<AccessTokenResponse?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonMap = prefs.getString('accessToken');

    Map<String, dynamic> mapToken = json.decode(jsonMap!);
    AccessTokenResponse accessToken = AccessTokenResponse.fromMap(mapToken);

    return accessToken;
  }

  static Future<void> setAccessToken(AccessTokenResponse accessToken) async {
    Map<String, dynamic> mapToken = accessToken.toMap();
    String jsonMap = json.encode(mapToken);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('accessToken', jsonMap);
  }

  static Future<void> setRefreshToken(AccessTokenResponse accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('refreshToken', accessToken.refreshToken!);
  }

  static Future<String?> getRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? refreshToken = prefs.getString('refreshToken');

    return refreshToken;
  }

  static Future<void> setGenreList(List<String> genreList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('genreList', genreList);
  }

  static Future<List<String>> getGenreList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> genreList =
        prefs.getStringList('genreList') ?? ["alternative"];

    return genreList;
  }

  static setGenreIndex(Map<String, int>? genreIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String trackListJSON = json.encode(genreIndex);
    prefs.setString('genreIndex', trackListJSON);
  }

  static Future<Map<String, int>> getGenreIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('genreIndex');

    if (id == null || id == "null") {
      return {
        "hip-hop": 0,
        "indie": 0,
        "pop": 0,
        "rock": 0,
        "country": 0,
        "metal": 0,
        "jazz": 0,
        "k-pop": 4,
        "edm": 0,
        "classical": 0,
        "latin": 0,
        "sad": 0,
        "r-n-b": 0,
        "alternative": 0,
        "afrobeat": 0,
        "techno": 0,
        "reggae": 0,
        "study": 0
      };
    } else {
      Map<String, dynamic> trackListString = json.decode(id);
      var newMap = trackListString.map((key, value) {
        if (value is int)
          return MapEntry(key, value);
        else
          return MapEntry(key, int.parse(value));
      });
      return newMap;
    }
  }

  static setPrefPlaylist(String playlistID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('prefPlaylist', playlistID);
  }

  static Future<String?> getPrefPlaylist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('prefPlaylist');

    if (id == "null" || id == null) {
      return null;
    } else {
      return id;
    }
  }

  static Future<void> setAvailableSongs(
      Map<String, List<Track>>? genreMapTracks) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String trackListJSON = json.encode(genreMapTracks);
    prefs.setString('genreMap', trackListJSON);
  }

  static Future<Map<String, List<Track>>> getAvailableSongs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('genreMap');
    if (id == null || id == "null") {
      return {
        "hip-hop": [],
        "indie": [],
        "pop": [],
        "rock": [],
        "country": [],
        "metal": [],
        "jazz": [],
        "k-pop": [],
        "edm": [],
        "classical": [],
        "latin": [],
        "sad": [],
        "r-n-b": [],
        "alternative": [],
        "afrobeat": [],
        "techno": [],
        "reggae": [],
        "study": []
      };
    }

    Map<String, dynamic> trackListString = json.decode(id);
    try {
      Map<String, List<Track>> mapStringAndDynamic =
          trackListString.map((key, value) {
        if (value == []) return MapEntry(key, value);
        List<Track> newList = [];
        for (int i = 0; i < value.length; i++) {
          newList.add(Track.fromJson(value[i]));
        }
        return MapEntry(key, newList);
      });

      return mapStringAndDynamic;
    } catch (e) {
      print("ERROROROROR");
      print(e);
      return {};
    }
  }

  static void setNumGenres(int num) {
    SharedPreferences.getInstance().then((element) {
      element.setInt('numGenres', num);
    });
  }

  static Future<int> getNumGenres() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int numGenres = prefs.getInt('numGenres') ?? 2;

    return numGenres;
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }

  static int currentIndex = 0;

  static getAppBar({
    SystemUiOverlayStyle? systemUiOverlayStyle,
    String? text,
    Color? color,
    double? toolbarHeight,
    TextStyle? textStyle,
    List<Widget>? action,
    Icon? leadingIcon,
    required void Function()? onTap,
    bool isLeadingIcon = false,
  }) {
    return AppBar(
      title: Text(
        text!,
        style: textStyle ??
            theme.textTheme.titleLarge!.copyWith(
              color: AppColor.black,
              fontWeight: FontWeight.w700,
            ),
      ),
      surfaceTintColor: AppColor.white,
      shadowColor: Color(0x34E7E4E4),
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      actions: action,
      leadingWidth: 60.h,
      leading: isLeadingIcon
          ? SizedBox(
              height: 0.h,
              width: 0.h,
            )
          : GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                  margin: EdgeInsets.only(left: 24.h),
                  padding: EdgeInsets.all(8.h),
                  height: 40.h,
                  width: 40.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.lightGray,
                  ),
                  child: leadingIcon ?? Icon(Icons.arrow_left)),
            ),
      centerTitle: false,
      toolbarHeight: 70.h,
      elevation: 12.h,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: color ?? Colors.white,
    );
  }

  static getInterestAppbar(
    BuildContext context, {
    SystemUiOverlayStyle? systemUiOverlayStyle,
    String? text,
    Color? color,
    double? toolbarHeight,
    TextStyle? textStyle,
    List<Widget>? action,
    Icon? leadingIcon,
    required void Function()? onTap,
    bool isLeadingIcon = false,
  }) {
    return AppBar(
      title: Text(
        text!,
        style: textStyle ??
            theme.textTheme.titleLarge!.copyWith(
              color: AppColor.black,
              fontWeight: FontWeight.w700,
            ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: IconButton(
            onPressed: () => showLogoutDialog(context),
            icon: Icon(Icons.logout, color: Colors.red),
          ),
        )
      ],
      surfaceTintColor: AppColor.white,
      shadowColor: Color(0x34E7E4E4),
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      leadingWidth: 30.h,
      leading: isLeadingIcon
          ? SizedBox(
              height: 0.h,
              width: 0.h,
            )
          : GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                margin: EdgeInsets.only(left: 24.h),
                padding: EdgeInsets.all(8.h),
                height: 40.h,
                width: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.lightGray,
                ),
                child: leadingIcon ?? Icon(Icons.arrow_left),
              )),
      centerTitle: false,
      toolbarHeight: 70.h,
      elevation: 12.h,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: color ?? Colors.white,
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
                await PrefData.setIntro(true);
                await PrefData.setLogin(true);
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
}
