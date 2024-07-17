import 'dart:async';

import 'package:Melofy/API/playlist_search.dart';
import 'package:dio/dio.dart';
import 'package:Melofy/API/playlist.dart' as playlistTrack;
import 'package:Melofy/API/profile.dart';
import 'package:Melofy/API/search.dart';
import 'package:Melofy/API/track.dart';
import 'package:Melofy/authorization/spotify_auth.dart';
import 'package:Melofy/data/pref_data/pref_data.dart';
import 'package:oauth2_client/access_token_response.dart';

class MakeAPICall {
  static AccessTokenResponse? accessToken;
  static final _dio = Dio();
  static var date;
  static var userDisplayName;

  static Future<AccessTokenResponse> _refreshToken() async {
    accessToken = await SpotifyAuthService.refreshToken();
    await PrefData.setAccessToken(accessToken!);
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
      await _refreshToken();
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

  static Future<void> searchForGenre(String genre, Map<String, int> genreIndex,
      Map<String, List<Track>> genreMap, String market) async {
    String path = "search";
    int timesRun = 0;
    List<Track> finalTracks = genreMap[genre]!;
    int limit = 50;

    while (finalTracks.length < 20) {
      if (timesRun >= 20) break;
      Map<String, dynamic> data = {
        'q': 'genre:$genre',
        'type': 'track',
        'limit': limit,
        'offset': genreIndex[genre],
        'market': market,
      };

      if (genreIndex[genre]! > 950) throw Exception("Too much offset");

      final Response<Map<String, dynamic>>? searchResponse =
          await makeGenericGetCall(path, data);

      if (searchResponse != null) {
        final SearchResult searchResult =
            SearchResult.fromJson(searchResponse.data!);
        final tracks = searchResult.tracks!.items;
        genreIndex[genre] = genreIndex[genre]! + limit;
        tracks!.removeWhere((item) => item.previewUrl == null);
        finalTracks += tracks;
      }
      timesRun++;
    }

    if (timesRun >= 20) {
      print("Something went wrong!!!");
    } else {
      genreMap[genre] = finalTracks;
    }
  }

  static Future<List<Track>> compileGenres() async {
    List<String> genreList = await PrefData.getGenreList();
    Map<String, List<Track>> genreMap = await PrefData.getAvailableSongs();
    Map<String, int> genreIndex = await PrefData.getGenreIndex();
    String market = await PrefData.getUserCountry();
    List<Track> finalList = [];
    List<String> errorList = [];

    for (String genre in genreList) {
      try {
        await searchForGenre(genre, genreIndex, genreMap, market);
      } catch (e) {
        if (e is DioException) {
          throw "DioException";
        } else {
          errorList.add(genre);
        }
      }
    }

    if (errorList.length != 0) {
      throw errorList.join(', ');
    }

    Map<String, List<Track>> newMap = Map.from(genreMap);
    newMap.removeWhere((key, value) => !genreList.contains(key));

    List<List<Track>> validLists = newMap.values.toList();
    int maxLength = calculateMax(validLists);
    for (int i = 0; i < maxLength; i++) {
      for (int j = 0; j < validLists.length; j++) {
        if (i < validLists[j].length && !finalList.contains(validLists[j][i]))
          finalList.add(validLists[j][i]);
      }
    }

    await PrefData.setGenreIndex(genreIndex);
    await PrefData.setAvailableSongs(genreMap);

    return finalList;
  }

  static int calculateMax(List<List<Track>> trackList) {
    int max = trackList[0].length;
    for (int i = 1; i < trackList.length; i++) {
      int length = trackList[i].length;

      if (length > max) max = length;
    }

    return max;
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

  static Future<String> createPlaylist(String name) async {
    String? userID = await PrefData.getUserID();
    String path = 'users/$userID/playlists';

    Map<String, dynamic> data = {
      'name': name,
      'description': "From Melofy <3",
      'public': false,
    };

    final Response<Map<String, dynamic>>? response =
        await makeGenericPostCall(path, data);

    if (response != null) {
      final playlist = playlistTrack.Playlist.fromJson(response.data!);
      return playlist.id!;
    } else {
      print("Did not work");
      throw Exception("Playlist not created proper");
    }
  }

  static Future<void> addSongsToPlaylist(
      List<Track> TrackList, String playlistID) async {
    String? userID = await PrefData.getUserID();
    if (userID == null) throw Exception("User ID is null");

    String path = 'playlists/$playlistID/tracks';

    Iterable<String> iterableList = TrackList.map((track) {
      return track.uri!;
    });

    Set<String> songSet = iterableList.toSet();
    List<String> songList = songSet.toList();

    int songsLeft = songList.length;

    while (songsLeft > 0) {
      int lowerLimit = 0;
      List<String> tempList;
      if (songList.length > 80) {
        tempList = songList.getRange(lowerLimit, lowerLimit + 80).toList();
      } else {
        tempList = songList;
      }
      songsLeft -= tempList.length;
      lowerLimit += tempList.length;
      songList = songList.getRange(lowerLimit, songList.length).toList();

      Map<String, dynamic> data = {'uris': tempList};

      final Response<Map<String, dynamic>>? response =
          await makeGenericPostCall(path, data);

      if (response != null) {
        print(response.data);
      } else {
        print("Did not work");
        throw Exception("Songs not added properly");
      }
    }
  }

  static Future<void> refreshName() async {
    String path = 'me';

    final Response<Map<String, dynamic>>? prof =
        await makeGenericGetCall(path, {});

    if (prof != null) {
      final profile = Profile.fromJson(prof.data!);
      await PrefData.setUserID(profile.id!);
      await PrefData.setUserCountry(profile.country!);
    } else {
      throw Exception("Name not set");
    }
  }

  static Future<List<Item>> getPlaylists() async {
    String path = 'me/playlists';

    final Response<Map<String, dynamic>>? prof =
        await makeGenericGetCall(path, {});

    if (prof != null) {
      final userID = await PrefData.getUserID();
      final playlistSearch = PlaylistSearch.fromJson(prof.data!);
      final playlists = playlistSearch.items!;
      playlists.removeWhere((element) {
        return element.owner!.id != userID;
      });
      return playlists;
    } else {
      throw Exception("Name not set");
    }
  }
}
