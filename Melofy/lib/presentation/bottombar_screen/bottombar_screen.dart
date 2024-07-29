import 'package:flutter/material.dart';
import 'package:Melofy/core/app_export.dart';
import 'package:Melofy/presentation/home_search_partners_page/home_search_partners_page.dart';
import 'package:Melofy/presentation/messages_page/messages_page.dart';
import '../../data/pref_data/pref_data.dart';
import 'controller/bottombar_screen_controller.dart';

class BottomBarScreen extends StatefulWidget {
  BottomBarScreen({Key? key}) : super(key: key);

  static List<Widget> pageList = [
    HomeSearchPartnersPage(),
    MessagesPage(),
  ];
  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Widget> pageList = [
    HomeSearchPartnersPage(),
    MessagesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: AppColor.white,
      home: Center(child: HomeSearchPartnersPage()),
      routes: {
        '/home_page': (context) => const HomeSearchPartnersPage(),
        '/liked_songs': (context) => const MessagesPage()
      },
      initialRoute: 'home_page',
    );
    // return GetBuilder<BottomBarScreenController>(
    //   builder: (controller) {
    //     // ignore: deprecated_member_use
    //     return WillPopScope(
    //       onWillPop: () {
    //         if (PrefData.currentIndex == 0) {
    //           {
    //             exitDialogBox(context, controller);
    //             controller.update();
    //           }
    //         } else {
    //           PrefData.currentIndex = 0;
    //           controller.update();
    //         }
    //         return Future(() => false);
    //       },
    //       child: Scaffold(
    //           backgroundColor: AppColor.white,
    //           body: Center(
    //             child: pageList.elementAt(0),
    //           ),
    //           bottomNavigationBar: CustomBottomBar()),
    //     );
    //   },
    //   init: BottomBarScreenController(),
    // );
  }

  void exitDialogBox(
      BuildContext context, BottomBarScreenController controller) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: AppColor.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.h))),
        insetPadding: EdgeInsets.only(left: 16.h, right: 16.h),
        title: Padding(
          padding: EdgeInsets.only(left: 15.h, right: 15.h),
          child: Text(
            'Are you sure you want to Exit ?',
            style: TextStyle(
              color: AppColor.black,
              fontSize: 18.fSize,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        actions: <Widget>[
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.h),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.h),
                          color: AppColor.primaryColor),
                      child: Padding(
                        padding: EdgeInsets.only(top: 14.h, bottom: 14.h),
                        child: Center(
                          child: Text(
                            'No',
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 18.fSize,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20.h,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    PrefData.currentIndex = 0;
                    Get.back();
                    controller.onExit();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.h),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.h),
                        color: AppColor.primaryColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 14.h, bottom: 14.h),
                        child: Center(
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.fSize,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
