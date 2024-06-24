import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'core/app_export.dart';
import 'data/pref_data/pref_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB66EQNOWWouIZ4oEP978q0v_9pMTIySlo",
            authDomain: "mana-music-9aebf.firebaseapp.com",
            projectId: "mana-music-9aebf",
            storageBucket: "mana-music-9aebf.appspot.com",
            messagingSenderId: "588489666068",
            appId: "1:588489666068:web:e626cd8daf29286d41c101",
            measurementId: "G-388NLBEJCF"));
  } else {
    await Firebase.initializeApp();
  }
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
  });
  await PrefData().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        translations: AppLocalization(),
        locale: Get.deviceLocale, //for setting localization strings
        fallbackLocale: Locale('en', 'US'),
        title: 'flutter_maths_mingle_app',
        initialBinding: InitialBindings(),
        initialRoute: AppRoutes.initialRoute,
        getPages: AppRoutes.pages,
      );
    });
  }
}
