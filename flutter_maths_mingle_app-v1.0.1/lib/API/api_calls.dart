import 'package:dio/dio.dart';
import 'package:flutter_maths_mingle_app/API/track.dart';
import 'package:flutter_maths_mingle_app/authorization/spotify_auth.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:oauth2_client/access_token_response.dart';

class MakeAPICall {
  static final player = AudioPlayer();
  static AccessTokenResponse? accessToken;
  static final _dio = Dio();

  static void _init() async {
    accessToken = await PrefData.getAccessToken();
  }

  static void _refreshToken() async {
    accessToken = await SpotifyAuthService.refreshToken();
    PrefData.setAccessToken(accessToken!);
  }

  static Future<Response<Map<String, dynamic>>?> makeGenericGetCall(
      String path, Map<String, dynamic> queryParameters) async {
    _init();
    accessToken = await PrefData.getAccessToken();

    if (accessToken!.isExpired()) _refreshToken();

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

  static void searchForSong() async {}

  static void playTrack(String trackID) async {
    String path = "tracks/$trackID";
    final Response<Map<String, dynamic>>? song =
        await makeGenericGetCall(path, {});

    if (song != null) {
      final track = Track.fromJson(song.data!);
      player.play(UrlSource(track.previewUrl!));
    } else {
      print("did not work!");
    }
  }
}
