import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_maths_mingle_app/API/playlist.dart' as playlistTrack;
import 'package:flutter_maths_mingle_app/API/profile.dart';
import 'package:flutter_maths_mingle_app/API/search.dart';
import 'package:flutter_maths_mingle_app/API/track.dart';
import 'package:flutter_maths_mingle_app/authorization/spotify_auth.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MakeAPICall {
  static AccessTokenResponse? accessToken;
  static final _dio = Dio();
  static var date;
  static var userDisplayName;
  static bool loginStatus = false;
  
  static Future<AccessTokenResponse> _refreshToken() async {
    accessToken = await SpotifyAuthService.refreshToken();
    PrefData.setAccessToken(accessToken!);
    print("Successful REFRESHHHHHHHH!!!!!");
    return accessToken!;
  }

  static Future<Response<Map<String, dynamic>>?> makeGenericGetCall(
      String path, Map<String, dynamic> queryParameters) async {
    accessToken = await PrefData.getAccessToken();

    const base_url = 'https://api.spotify.com/v1/';

    try {
      Response<Map<String, dynamic>> response = await _dio.get(base_url + path,
          queryParameters: queryParameters,
          options: Options(headers: {
            'Authorization': 'Bearer ${accessToken!.accessToken}'
          }));

      if (response.statusCode != 200 && response.statusCode != 201) {
        print("Not proper");
        print(response.statusCode);
        return null;
      }
      return response;
    } catch (e) {
      await _refreshToken();
      accessToken = await PrefData.getAccessToken();

      Response<Map<String, dynamic>> response = await _dio.get(base_url + path,
          queryParameters: queryParameters,
          options: Options(headers: {
            'Authorization': 'Bearer ${accessToken!.accessToken}'
          }));

      if (response.statusCode != 200 && response.statusCode != 201) {
        print("Not proper");
        print(response.statusCode);
        return null;
      }
      return response;
    }
  }

  static Future<Response<Map<String, dynamic>>?> makeGenericPostCall(
      String path, Map<String, dynamic> data) async {
    accessToken = await PrefData.getAccessToken();

    const base_url = 'https://api.spotify.com/v1/';

    try {
      Response<Map<String, dynamic>> response = await _dio.post(base_url + path,
          data: data,
          options: Options(headers: {
            'Authorization': 'Bearer ${accessToken!.accessToken}'
          }));

      if (response.statusCode != 201 && response.statusCode != 200) {
        print("Not proper");
        print(response.statusCode);
        return null;
      }
      return response;
    } catch (e) {
      _refreshToken();
      accessToken = await PrefData.getAccessToken();
      Response<Map<String, dynamic>> response = await _dio.post(base_url + path,
          data: data,
          options: Options(headers: {
            'Authorization': 'Bearer ${accessToken!.accessToken}'
          }));

      if (response.statusCode != 201 && response.statusCode != 200) {
        print("Not proper");
        print(response.statusCode);
        return null;
      }
      return response;
    }
  }

  /////////////////////////////////////////////////////////////////////////
  ///
  /////////////////////////////////////////////////////////////////////////
  ///
  /////////////////////////////////////////////////////////////////////////
  ///
  /////////////////////////////////////////////////////////////////////////

  static Future<String> createPlaylist() async {
    String? userID = await PrefData.getUserID();
    if (userID == null) {
      print("UserID is null");
      throw Exception("UserID is null");
    }

    String path = 'users/$userID/playlists';

    Map<String, dynamic> data = {
      'name': 'Music4U :)',
      'description': "Enjoy some tunes <3",
      'public': false,
    };

    final Response<Map<String, dynamic>>? response =
        await makeGenericPostCall(path, data);

    if (response != null) {
      print("Playlist Created");
      final playlist = playlistTrack.Playlist.fromJson(response.data!);
      PrefData.setPlaylistID(playlist.id!);
      return playlist.id!;
    } else {
      print("Did not work");
      throw Exception("Playlist not created proper");
    }
  }

  static Future<List<Track>> searchForGenre(
      String genre, int limit, int offset) async {
    String market = await PrefData.getUserCountry();
    String path = "search";

    Map<String, dynamic> data = {
      'q': 'genre:$genre',
      'type': 'track',
      'limit': limit,
      'offset': offset,
      'market': market,
    };

    final Response<Map<String, dynamic>>? searchResponse =
        await makeGenericGetCall(path, data);

    if (searchResponse != null) {
      final SearchResult searchResult =
          SearchResult.fromJson(searchResponse.data!);
      final tracks = searchResult.tracks!.items;
      tracks!.removeWhere((item) => item.previewUrl == null);
      return tracks;
    } else {
      throw Exception("Did not get profile");
    }
  }

  static Future<List<Track>> compileGenres() async {
    List<String> genreList = await PrefData.getGenreList();
    int genreIndex = await PrefData.getGenreIndex();
    print(genreIndex);
    List<List<Track>> trackList = [];
    List<Track> finalTracks = [];

    int limit = 40;

    switch (genreList.length) {
      case 1:
        limit = 50;
      case 2:
        limit = 35;
      case 3:
        limit = 26;
      case 4:
        limit = 20;
      case 5:
        limit = 16;
    }

    for (String genre in genreList) {
      trackList.add(await searchForGenre(genre, limit, genreIndex));
    }

    int maxLength = calculateMax(trackList);
    for (int i = 0; i < maxLength; i++) {
      for (List<Track> specificGenre in trackList) {
        if (i < specificGenre.length) finalTracks.add(specificGenre[i]);
      }
    }

    Set<Track> setList = finalTracks.toSet();
    finalTracks = setList.toList();

    return finalTracks;
  }

  static int calculateMax(List<List<Track>> trackList) {
    int max = trackList[0].length;
    for (int i = 1; i < trackList.length; i++) {
      int length = trackList[i].length;

      if (length > max) max = length;
    }

    return max;
  }

  // static Future<Profile> getProfile() async {
  //   String path = 'me';

  //   final Response<Map<String, dynamic>>? prof =
  //       await makeGenericGetCall(path, {});

  //   if (prof != null) {
  //     final profile = Profile.fromJson(prof.data!);
  //     PrefData.setUserID(profile.id!);
  //     return profile;
  //   } else {
  //     throw Exception("Did not get profile");
  //   }
  // }

  static Future<Track> getTrack(String trackID) async {
    String path = "tracks/$trackID";
    final Response<Map<String, dynamic>>? song =
        await makeGenericGetCall(path, {});

    if (song != null) {
      final track = Track.fromJson(song.data!);
      return track;
    } else {
      return Track();
    }
  }

  static void addSongsToPlaylist(List<Track> TrackList) async {
    String? playlistID = await PrefData.getPlaylistID();
    if (playlistID == null) playlistID = await createPlaylist();

    String path = 'playlists/$playlistID/tracks';

    Iterable<String> iterableList = TrackList.map((track) {
      return track.uri!;
    });

    List<String> songList = iterableList.toList();

    Map<String, dynamic> data = {'uris': songList};

    final Response<Map<String, dynamic>>? response =
        await makeGenericPostCall(path, data);

    if (response != null) {
      print(response.data);
    } else {
      print("Did not work");
      throw Exception("Songs not added properly");
    }
  }

  static void saveProfileData(CollectionReference users, Profile profile) {
    print("here");
    var userEmail = profile.email;
    var userDisplayName = profile.displayName;
    var userCountry = profile.country;
    var userId = profile.id;
    final time = DateTime.now();
    print(userEmail);
    print(userDisplayName);
    print(userCountry);
    print(userId);
    print(time.month.toString() +
        " / " +
        time.day.toString() +
        " / " +
        time.year.toString());
    try {
      users.add({
        'email': userEmail,
        'displayName': userDisplayName,
        'userCountry': userCountry,
        'userID': userId,
        'dateCreated': time.month.toString() +
            " / " +
            time.day.toString() +
            " / " +
            time.year.toString(),
        'birthdate': date,
      });
      print("works");
    } catch (e) {
      print("error");
    }
  }

  static Future<Profile> saveProfile(CollectionReference users) async {
    String path = 'me';

    final Response<Map<String, dynamic>>? prof =
        await makeGenericGetCall(path, {});

    if (prof != null) {
      final profile = Profile.fromJson(prof.data!);
      PrefData.setUserID(profile.id!);
      PrefData.setUserCountry(profile.country!);
      print("save data");
      saveProfileData(users, profile);
      setDisplayName(profile.displayName);
      print("done");
      return profile;
    } else {
      throw Exception("Did not get profile");
    }
  }

  static void setBirthday(DateTime d) {
    String setDate = d.toString().substring(0, 10);
    date = setDate;
  }

  static void setDisplayName(String? d) {
    userDisplayName = d;
  }

  static String? getDisplayName() {
    if (userDisplayName == null) {
      return "null User";
    }
    return userDisplayName;
  }

  static Future<Profile> refreshName() async {
    String path = 'me';

    final Response<Map<String, dynamic>>? prof =
        await makeGenericGetCall(path, {});

    if (prof != null) {
      final profile = Profile.fromJson(prof.data!);
      setDisplayName(profile.displayName);
      return profile;
    } else {
      throw Exception("Name not set");
    }
  }
  static void setLoginStatus (bool b){
    loginStatus = b;
  }
}
