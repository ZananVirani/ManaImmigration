/**
 * Class that defines all the API calls that are made to the Spotify API.
 */

import 'dart:async';

import 'package:Melofy/API/models/artist.dart' as artist;
import 'package:Melofy/API/models/artist_tracks.dart';
import 'package:Melofy/API/models/playlist_search.dart';
import 'package:Melofy/API/models/related.dart';
import 'package:dio/dio.dart';
import 'package:Melofy/API/models/playlist.dart' as playlistTrack;
import 'package:Melofy/API/models/profile.dart';
import 'package:Melofy/API/models/search.dart';
import 'package:Melofy/API/models/track.dart';
import 'package:Melofy/authorization/spotify_auth.dart';
import 'package:Melofy/data/pref_data/pref_data.dart';
import 'package:oauth2_client/access_token_response.dart';

class MakeAPICall {
  // Access token to be used for all API calls
  // Needed because Spotify API uses OAuth2.0
  static AccessTokenResponse? accessToken;
  // Dio object to make API calls
  static final _dio = Dio();
  // User display name
  static var userDisplayName;

  /**
   * Function to refresh the access token, because it expires after an hour.
   */
  static Future<AccessTokenResponse> _refreshToken() async {
    accessToken = await SpotifyAuthService.refreshToken();
    await PrefData.setAccessToken(accessToken!);
    return accessToken!;
  }

  /**
   * Function to make a generic GET call to the Spotify API.
   * @param path: The path to be appended to the base URL.
   * @param queryParameters: The query parameters to be passed in the API call.
   * @return: The response from the API call.
   */
  static Future<Response<Map<String, dynamic>>?> makeGenericGetCall(
      String path, Map<String, dynamic> queryParameters) async {
    accessToken = await PrefData.getAccessToken();

    const base_url = 'https://api.spotify.com/v1/';

    /* 
        If the access token has expired, then refresh the token and make the API call again.
        This is because the access token expires after an hour.
        This is the purpose of the try-catch block, and to handle any other
        exceptions that may occur.
      */
    try {
      Response<Map<String, dynamic>> response = await _dio.get(base_url + path,
          queryParameters: queryParameters,
          options: Options(headers: {
            'Authorization': 'Bearer ${accessToken!.accessToken}'
          }));

      // If the response is not 200 or 201, then the API call was not successful.
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

  /**
   * Function to make a generic POST call to the Spotify API.
   * @param path: The path to be appended to the base URL.
   * @param data: The data to be passed in the API call.
   * @return: The response from the API call.
   */
  static Future<Response<Map<String, dynamic>>?> makeGenericPostCall(
      String path, Map<String, dynamic> data) async {
    accessToken = await PrefData.getAccessToken();

    const base_url = 'https://api.spotify.com/v1/';

    /* 
        If the access token has expired, then refresh the token and make the API call again.
        This is because the access token expires after an hour.
        This is the purpose of the try-catch block, and to handle any other
        exceptions that may occur.
      */
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

  /**
   * Function to search and retrieve tracks on the Spotify API.
   * @param genre: The genre to be searched for.
   * @param genreIndex: Map that keeps track of what index to start searching from for each genre.
   * @param genreMap: Map that keeps track of the tracks that have been found for each genre.
   * @param market: The market to be searched in.
   * @return: The list of tracks that match the query.
   */
  static Future<void> searchForGenre(String genre, Map<String, int> genreIndex,
      Map<String, List<Track>> genreMap, String market) async {
    String path = "search";
    // Counter to make sure that the program terminates.
    int timesRun = 0;
    // Tracks currently stored for each genre.
    List<Track> finalTracks = genreMap[genre]!;
    int limit = 50;

    // While the finalTracks list is less than 20, keep searching for tracks
    // until it reaches 20 songs or more.
    while (finalTracks.length < 20) {
      if (timesRun >= 20) break;
      // Data to be passed in the API call.
      Map<String, dynamic> data = {
        'q': 'genre:$genre',
        'type': 'track',
        'limit': limit,
        'offset': genreIndex[genre],
        'market': market,
      };

      // Max offset of Spotify API is 1000, so if the offset is greater than 950, then throw an exception,
      // because the API will not be able to return 50 tracks.
      if (genreIndex[genre]! > 950) throw Exception("Too much offset");

      final Response<Map<String, dynamic>>? searchResponse =
          await makeGenericGetCall(path, data);

      // If the response is not null, then add the tracks to the finalTracks list.
      if (searchResponse != null) {
        final SearchResult searchResult =
            SearchResult.fromJson(searchResponse.data!);
        final tracks = searchResult.tracks!.items;
        genreIndex[genre] = genreIndex[genre]! + limit;
        // Remove tracks that do not have a preview URL, as the song can not be played in Melofy.
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

  /**
   * Function that calls searchForGenre and returns a list of tracks.
   */
  static Future<List<Track>> compileGenres() async {
    // Genres available in the app.
    List<String> genreList = await PrefData.getGenreList();
    // Tracks available for each genre, already fetched from the API.
    Map<String, List<Track>> genreMap = await PrefData.getAvailableSongs();
    // Index to keep track of where to start searching for each genre.
    Map<String, int> genreIndex = await PrefData.getGenreIndex();
    // Market to search in.
    String market = await PrefData.getUserCountry();

    // Final list of tracks to be returned.
    List<Track> finalList = [];
    // List of genres that have reached the end of the Spotify API.
    List<String> errorList = [];

    for (String genre in genreList) {
      try {
        await searchForGenre(genre, genreIndex, genreMap, market);
      } catch (e) {
        if (e is DioException) {
          throw "DioException";
        } else {
          // If the offset is too much, then add the genre to the error list.
          // This means that the user has reached the end of the Spotify API for that genre.
          errorList.add(genre);
        }
      }
    }

    // If the user has reached the end of the Spotify API for any genre, then throw an exception.
    if (errorList.length != 0) {
      throw errorList.join(', ');
    }

    // Create a new map with only the genres that the user has selected.
    Map<String, List<Track>> newMap = Map.from(genreMap);
    newMap.removeWhere((key, value) => !genreList.contains(key));

    // Add the songs in the final list in the order of the genres selected by the user.
    // Alternates between the genres to add the songs.
    List<List<Track>> validLists = newMap.values.toList();
    int maxLength = calculateMax(validLists);
    for (int i = 0; i < maxLength; i++) {
      for (int j = 0; j < validLists.length; j++) {
        if (i < validLists[j].length && !finalList.contains(validLists[j][i]))
          finalList.add(validLists[j][i]);
      }
    }

    // Save the genreIndex and genreMap to the shared preferences.
    await PrefData.setGenreIndex(genreIndex);
    await PrefData.setAvailableSongs(genreMap);

    return finalList;
  }

  /**
   * Function to calculate the maximum length of the list of tracks for each genre.
   */
  static int calculateMax(List<List<Track>> trackList) {
    int max = trackList[0].length;
    for (int i = 1; i < trackList.length; i++) {
      int length = trackList[i].length;

      if (length > max) max = length;
    }

    return max;
  }

  /**
   * Function to get the related artists and top tracks for a particular artist.
   * @param artistID: The ID of the artist.
   */
  static Future<List<dynamic>> getArtistandTracks(String artistID) async {
    String path = "artists/$artistID";
    String market = await PrefData.getUserCountry();
    final Response<Map<String, dynamic>>? artistResponse =
        await makeGenericGetCall(path, {});

    final Response<Map<String, dynamic>>? tracksResponse =
        await makeGenericGetCall(path + "/top-tracks", {'market': market});
    final Response<Map<String, dynamic>>? alikeResponse =
        await makeGenericGetCall(path + "/related-artists", {});
    final Response<Map<String, dynamic>>? singleAlbums =
        await makeGenericGetCall(
            path + "/albums", {'include_groups': 'single'});

    if (artistResponse != null &&
        tracksResponse != null &&
        singleAlbums != null) {
      final artistInfo = artist.Artist.fromJson(artistResponse.data!);
      final trackInfo = ArtistTracks.fromJson(tracksResponse.data!);
      final tracks = trackInfo.tracks!;
      final alikeArtists = RelatedArtists.fromJson(alikeResponse!.data!);
      final singles = ArtistTracks.fromJson(singleAlbums.data!);
      tracks.removeWhere((item) => item.previewUrl == null);
      return [
        artistInfo,
        tracks,
        alikeArtists,
        singles
      ]; //Add alikeArtists in here but doesnt work
    } else {
      throw Exception("Not good");
    }
  }

  /**
   * Function that creates a new playlist in the user's Spotify account.
   * @param name: The name of the playlist.
   */
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

  /**
   * Function that adds songs to a particular playlist on the user's Spotify account.
   * @param TrackList: The list of tracks to be added to the playlist.
   * @param playlistID: The ID of the playlist.
   */
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

    // Send the songs in batches of 80, as the Spotify API only allows 100 songs to be added at a time.
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

  /**
   * Function to refresh all of the user's data, such as the user's ID and country.
   * This is done to ensure that the user's data is up to date.
   */
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

  /**
   * Function to get all of the user's current playlists, so they can choose
   * which one they want to add the songs to.
   */
  static Future<List<Item>> getPlaylists() async {
    String path = 'me/playlists';

    final Response<Map<String, dynamic>>? prof =
        await makeGenericGetCall(path, {});

    if (prof != null) {
      final userID = await PrefData.getUserID();
      final playlistSearch = PlaylistSearch.fromJson(prof.data!);
      final playlists = playlistSearch.items!;
      // Remove all playlists that they do not own, and therefore might not be
      // able to add songs to.
      playlists.removeWhere((element) {
        return element.owner!.id != userID;
      });
      return playlists;
    } else {
      throw Exception("Name not set");
    }
  }
}
