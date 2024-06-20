import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_maths_mingle_app/API/playlist.dart' as playlistTrack;
import 'package:flutter_maths_mingle_app/API/profile.dart';
import 'package:flutter_maths_mingle_app/API/track.dart';
import 'package:flutter_maths_mingle_app/authorization/spotify_auth.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:oauth2_client/access_token_response.dart';

class MakeAPICall {
  static final player = AudioPlayer();
  static AccessTokenResponse? accessToken;
  static final _dio = Dio();

  static Future<AccessTokenResponse> _refreshToken() async {
    accessToken = await SpotifyAuthService.refreshToken();
    PrefData.setAccessToken(accessToken!);
    return accessToken!;
  }

  static Future<Response<Map<String, dynamic>>?> makeGenericGetCall(
      String path, Map<String, dynamic> queryParameters) async {
    accessToken = await PrefData.getAccessToken();

    if (accessToken!.isExpired()) {
      _refreshToken().then((value) {
        accessToken = value;
        return value;
      });
    }

    const base_url = 'https://api.spotify.com/v1/';

    Response<Map<String, dynamic>> response = await _dio.get(base_url + path,
        queryParameters: queryParameters,
        options: Options(
            headers: {'Authorization': 'Bearer ${accessToken!.accessToken}'}));

    if (response.statusCode != 200) {
      print("Not proper");
      return null;
    }

    return response;
  }

  static Future<Response<Map<String, dynamic>>?> makeGenericPostCall(
      String path, Map<String, dynamic> data) async {
    accessToken = await PrefData.getAccessToken();

    if (accessToken!.isExpired()) {
      _refreshToken().then((value) {
        accessToken = value;
        return value;
      });
    }

    const base_url = 'https://api.spotify.com/v1/';

    Response<Map<String, dynamic>> response = await _dio.post(base_url + path,
        data: data,
        options: Options(
            headers: {'Authorization': 'Bearer ${accessToken!.accessToken}'}));

    if (response.statusCode != 201) {
      print("Not proper");
      return null;
    }

    return response;
  }

  static void createPlaylist() async {
    String? userID = await PrefData.getUserID();
    if (userID == null) {
      print("UserID is null");
      return;
    }

    String path = 'users/$userID/playlists';

    Map<String, dynamic> data = {
      'name': 'Music4U :)',
      'public': false,
    };

    final Response<Map<String, dynamic>>? response =
        await makeGenericPostCall(path, data);

    if (response != null) {
      print("Playlist Created");
      final playlist = playlistTrack.Playlist.fromJson(response.data!);
      PrefData.setPlaylistID(playlist.id!);
    } else
      print("Did not work");
  }

  static void searchForSong() async {}

  static Future<Profile> getProfile() async {
    String path = 'me';

    final Response<Map<String, dynamic>>? prof =
        await makeGenericGetCall(path, {});

    if (prof != null) {
      final profile = Profile.fromJson(prof.data!);
      PrefData.setUserID(profile.id!);
      return profile;
    } else {
      throw Exception("Did not get profile");
    }
  }

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

  static void addSongToPlaylist(String trackID, List<String> songList) async {
    String? playlistID = await PrefData.getPlaylistID();

    if (playlistID == null) {
      print("PlaylistID is null");
      return;
    }

    String path = 'playlists/$playlistID/tracks';

    Map<String, dynamic> data = {'uris': songList};

    final Response<Map<String, dynamic>>? response =
        await makeGenericPostCall(path, data);

    if (response != null) {
      print("Songs added");
    } else
      print("Did not work");
  }
}
