/**
 * Class that contains all of the methods to authenticate the user with Spotify Auth2.0.
 */

import 'dart:convert';

import 'package:Melofy/data/pref_data/pref_data.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/spotify_oauth2_client.dart';
import 'package:dio/dio.dart';

/**
 * Class that contains all of the methods to authenticate the user with Spotify Auth2.0.
 */
class SpotifyAuthService {
  static SpotifyOAuth2Client client = SpotifyOAuth2Client(
    customUriScheme: 'com.fluttermathsmingleapp.app',
    //Must correspond to the AndroidManifest's "android:scheme" attribute
    redirectUri:
        'com.fluttermathsmingleapp.app:/', //Can be any URI, but the scheme part must correspond to the customeUriScheme
  );
  static const clientID = 'e07c50e68b85419eafe9e829beccd607';
  static final _dio = Dio();
  static const clientSecret = '215936d864934148923789a79016a53f';

  /**
   * Method to get the access token from the user, if the user chooses to authenticate with Spotify.
   */
  static Future<AccessTokenResponse?> getAccessToken() async {
    AccessTokenResponse? accessToken;

    var authResp =
        await client.requestAuthorization(clientId: clientID, customParams: {
      'show_dialog': 'true'
    }, scopes: [
      'playlist-modify-public',
      'playlist-modify-private',
      'user-read-private',
      'user-read-email',
      'playlist-read-private'
    ]);
    var authCode = authResp.code;

    if (authCode == null) return null;

    try {
      accessToken = await client.requestAccessToken(
          code: authCode.toString(),
          clientId: clientID,
          clientSecret: clientSecret);
    } catch (e) {
      print("Error");
    }

    return accessToken;
  }

  /**
   * Method to refresh the access token of the user, given that the access token
   * expires after 1 hour.
   */
  static Future<AccessTokenResponse> refreshToken() async {
    String? refreshToken = await PrefData.getRefreshToken();

    String credentials = "$clientID:$clientSecret";
    String encoded = base64.encode(utf8.encode(credentials));

    try {
      Response<dynamic> responseToken =
          await _dio.post('https://accounts.spotify.com/api/token',
              queryParameters: {
                'grant_type': 'refresh_token',
                'refresh_token': refreshToken,
              },
              options: Options(headers: {
                'content-type': 'application/x-www-form-urlencoded',
                'Authorization': 'Basic $encoded'
              }));

      Map<String, dynamic> mapToken = responseToken.data;
      AccessTokenResponse accessToken = AccessTokenResponse.fromMap(mapToken);
      return accessToken;
    } catch (e) {
      print("ERRORRRRR");
      print(e);
    }

    return AccessTokenResponse();
  }
}
