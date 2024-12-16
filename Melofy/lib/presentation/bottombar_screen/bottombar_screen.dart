import 'package:flutter/material.dart';
import 'package:Melofy/core/app_export.dart';
import 'package:Melofy/presentation/home_search_partners_page/home_search_partners_page.dart';
import 'package:Melofy/presentation/messages_page/messages_page.dart';

/**
 * Class for BottomBarScreen, which is the overall screen for the application,
 * which contains the bottom navigation bar and the pages that are navigated to.
 */
class BottomBarScreen extends StatefulWidget {
  BottomBarScreen({Key? key}) : super(key: key);

  static List<Widget> pageList = [
    HomeSearchPartnersPage(),
    MessagesPage(),
  ];
  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

/**
 * State class for BottomBarScreen, which contains the state of the BottomBarScreen.
 */
class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Widget> pageList = [
    HomeSearchPartnersPage(),
    MessagesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        color: AppColor.white,
        home: Center(child: HomeSearchPartnersPage()),
        routes: {
          '/home_page': (context) => const HomeSearchPartnersPage(),
          '/liked_songs': (context) => const MessagesPage()
        },
        initialRoute: 'home_page',
      ),
    );
  }
}
