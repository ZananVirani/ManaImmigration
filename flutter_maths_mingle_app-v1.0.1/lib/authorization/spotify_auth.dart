//import 'package:oauth2_client/oauth2_helper.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/spotify_oauth2_client.dart';

class SpotifyAuthService {
  static String clientID = 'e07c50e68b85419eafe9e829beccd607';

  static Future<AccessTokenResponse?> getAccessToken() async {
    AccessTokenResponse? accessToken;
    SpotifyOAuth2Client client = SpotifyOAuth2Client(
      customUriScheme: 'my.test.app',
      //Must correspond to the AndroidManifest's "android:scheme" attribute
      redirectUri:
          'my.test.app:/', //Can be any URI, but the scheme part must correspond to the customeUriScheme
    );

    var authResp =
        await client.requestAuthorization(clientId: clientID, customParams: {
      'show_dialog': 'true'
    }, scopes: [
      'user-read-private',
      'user-read-playback-state',
      'user-modify-playback-state',
      'user-read-currently-playing',
      'user-read-email'
    ]);
    var authCode = authResp.code;

    if (authCode == null) return null;

    try {
      accessToken = await client.requestAccessToken(
          code: authCode.toString(),
          clientId: clientID,
          clientSecret: '215936d864934148923789a79016a53f');
    } catch (e) {
      print("Error");
    }

    return accessToken;
  }

  static Future<AccessTokenResponse?> refreshToken(
      AccessTokenResponse? accessToken) async {
    SpotifyOAuth2Client client = SpotifyOAuth2Client(
      customUriScheme: 'my.test.app',
      redirectUri: 'my.test.app:/',
    );

    var newToken =
        client.refreshToken(accessToken!.refreshToken!, clientId: clientID);

    return newToken;
  }
}
