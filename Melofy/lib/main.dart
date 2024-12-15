/**
 * Entry point of the application, where the application starts running the program.
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/app_export.dart';
import 'data/pref_data/pref_data.dart';

/**
 * Main function of the application, where the application starts running the program.
 */
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Set the preferred orientation of the application to portraitUp
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
  });
  // Initialize the shared preferences for persisting data storage.
  await PrefData().init();
  // Run the application
  runApp(MyApp());
}

/**
 * MyApp class is the root widget of the application, where the application starts running the program.
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Sizer(builder: (context, orientation, deviceType) {
        return PopScope(
          canPop: false,
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            translations: AppLocalization(),
            locale: Get.deviceLocale, //for setting localization strings
            fallbackLocale: Locale('en', 'US'),
            title: 'Melofy',
            initialBinding: InitialBindings(),
            initialRoute:
                AppRoutes.initialRoute, //initial route of  the application
            getPages: AppRoutes.pages,
          ),
        );
      }),
    );
  }
}
