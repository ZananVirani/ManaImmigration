/**
 * This class is used to store some overall shared preferences interactions.
 */
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  // Singleton instance
  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  // Initialize the shared preferences
  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  // will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  // Set the theme data in the shared preferences.
  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  // Get the theme data from the shared preferences
  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }
}
