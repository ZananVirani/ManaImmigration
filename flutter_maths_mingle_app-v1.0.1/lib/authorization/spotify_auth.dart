//import 'package:oauth2_client/oauth2_helper.dart';
import 'dart:convert';

//import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/spotify_oauth2_client.dart';
import 'package:dio/dio.dart';

class SpotifyAuthService {
  static SpotifyOAuth2Client client = SpotifyOAuth2Client(
    customUriScheme: 'my.test.app',
    //Must correspond to the AndroidManifest's "android:scheme" attribute
    redirectUri:
        'my.test.app:/', //Can be any URI, but the scheme part must correspond to the customeUriScheme
  );
  static const clientID = 'e07c50e68b85419eafe9e829beccd607';
  static final _dio = Dio();
  static const clientSecret = '215936d864934148923789a79016a53f';

  static Future<AccessTokenResponse?> getAccessToken() async {
    AccessTokenResponse? accessToken;

    var authResp =
        await client.requestAuthorization(clientId: clientID, customParams: {
      'show_dialog': 'true'
    }, scopes: [
      'playlist-modify-public',
      'playlist-modify-private',
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

  static Future<AccessTokenResponse> refreshToken() async {
    AccessTokenResponse? accessToken = await PrefData.getAccessToken();

    String credentials = "$clientID:$clientSecret";
    String encoded = base64.encode(utf8.encode(credentials));

    Response<dynamic> responseToken =
        await _dio.post('https://accounts.spotify.com/api/token',
            queryParameters: {
              'grant_type': 'refresh_token',
              'refresh_token': accessToken!.refreshToken,
              'client_id': clientID
            },
            options: Options(headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
              'Authorization': "Basic $encoded"
            }));

    Map<String, dynamic> mapToken = responseToken.data;
    accessToken = AccessTokenResponse.fromMap(mapToken);

    // final refresh = Refresh.fromJson(newToken.data);

    // String? rToken = await PrefData.getRefreshToken();

    // try {
    //   accessToken = await client.refreshToken(rToken!, clientId: clientID);
    //   print(accessToken.accessToken);
    //   print(accessToken.errorDescription);
    // } catch (e) {
    //   print("Something crashed!");
    // }

    return accessToken;
  }
}
