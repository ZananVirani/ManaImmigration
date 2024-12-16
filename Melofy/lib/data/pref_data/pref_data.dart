/**
 * File that contains all of the main interactions between shared preferences.
 */

import 'dart:convert';
import 'package:Melofy/API/models/track.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:oauth2_client/access_token_response.dart';

/**
 * Class that contains all of the main interactions between shared preferences.
 */
class PrefData {
  static String prefName = "com.fluttermathsmingleapp.app";
  static SharedPreferences? _sharedPreferences;

  // Constructor
  PrefData() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  /**
   * Initialize the shared preferences
   */
  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  /**
   * Get the shared preferences
   */
  Future<SharedPreferences> get getPref async {
    return _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  /**
   * Clear all the data stored in the shared preferences
   */
  static Future<void> clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  /**
   * Setter method for if the user should go to the onboarding screen.
   */
  static setIntro(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('intro', value);
  }

  /**
   * Getter method for if the user should go to the onboarding screen.
   */
  static Future<bool> getIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('intro') ?? true;
  }

  /**
   * Setter method for if the user should get the tutorial screen.
   */
  static setTutorial(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('tutorial', value);
  }

  /**
    * Getter method for if the user should get the tutorial screen.
   */
  static Future<bool> getTutorial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('tutorial') ?? true;
  }

  /**
   * Setter method for if the user should go to the login screen.
   */
  static setLogin(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('login', value);
  }

  /**
   * Getter method for if the user should go to the login screen.
   */
  static Future<bool> getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('login') ?? true;
  }

  /**
   * Setter method for the user ID.
   */
  static Future<void> setUserID(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userID', id);
  }

  /**
   * Getter method for the user ID.
   */
  static Future<String?> getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('userID');

    return id;
  }

  /**
   * Setter method for the user country.
   */
  static Future<void> setUserCountry(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userCountry', id);
  }

  /**
   * Getter method for the user country.
   */
  static Future<String> getUserCountry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('userCountry') ?? "CA";

    return id;
  }

  /**
   * Add a song to the music list.
   */
  static Future<void> addSong(Track track) async {
    getMusicList().then((list) {
      list!.add(track);
      setMusicList(list);
    });
  }

  /**
   * Remove a song from the music list.
   */
  static void removeSong(Track track) async {
    getMusicList().then((list) {
      list!.remove(track);
      setMusicList(list);
    });
  }

  /**
   * Setter method for the music list.
   */
  static setMusicList(List<Track> trackList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String trackListJSON = json.encode(trackList);
    prefs.setString('trackList', trackListJSON);
  }

  /**
   * Getter method for the music list.
   */
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

  /**
   * Getter method for the access token.
   */
  static Future<AccessTokenResponse?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonMap = prefs.getString('accessToken');

    Map<String, dynamic> mapToken = json.decode(jsonMap!);
    AccessTokenResponse accessToken = AccessTokenResponse.fromMap(mapToken);

    return accessToken;
  }

  /**
   * Setter method for the access token.
   */
  static Future<void> setAccessToken(AccessTokenResponse accessToken) async {
    Map<String, dynamic> mapToken = accessToken.toMap();
    String jsonMap = json.encode(mapToken);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('accessToken', jsonMap);
  }

  /**
   * Setter method for the refresh token.
   */
  static Future<void> setRefreshToken(AccessTokenResponse accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('refreshToken', accessToken.refreshToken!);
  }

  /**
   * Getter method for the refresh token.
   */
  static Future<String?> getRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? refreshToken = prefs.getString('refreshToken');

    return refreshToken;
  }

  /**
   * Setter method for the list of genres that Melofy has available.
   */
  static Future<void> setGenreList(List<String> genreList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('genreList', genreList);
  }

  /**
   * Getter method for the list of genres that Melofy has available.
   */
  static Future<List<String>> getGenreList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> genreList =
        prefs.getStringList('genreList') ?? ["alternative"];

    return genreList;
  }

  /**
   * Setter method for the map of each genre to the offset it is currently at.
   */
  static setGenreIndex(Map<String, int>? genreIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String trackListJSON = json.encode(genreIndex);
    prefs.setString('genreIndex', trackListJSON);
  }

  /**
   * Getter method for the map of each genre to the offset it is currently at.
   */
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

  /**
   * Setter method for the last playlist the user has added songs to.
   */
  static setPrefPlaylist(String playlistID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('prefPlaylist', playlistID);
  }

  /**
   * Getter method for the last playlist the user has added songs to.
   */
  static Future<String?> getPrefPlaylist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('prefPlaylist');

    if (id == "null" || id == null) {
      return null;
    } else {
      return id;
    }
  }

  /**
   * Setter method for the map of each genre to the list of available songs that have been fetched
   * from the API.
   */
  static Future<void> setAvailableSongs(
      Map<String, List<Track>>? genreMapTracks) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String trackListJSON = json.encode(genreMapTracks);
    prefs.setString('genreMap', trackListJSON);
  }

  /**
   * Getter method for the map of each genre to the list of available songs that have been fetched
   * from the API.
   */
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

  // Current screen the user is on, so that the correct tab icon can be highlighted.
  static int currentIndex = 0;
}
