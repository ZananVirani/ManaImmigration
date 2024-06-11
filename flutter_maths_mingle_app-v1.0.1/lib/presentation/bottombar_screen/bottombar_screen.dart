import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/presentation/discover_page/discover_page.dart';
import 'package:flutter_maths_mingle_app/presentation/home_make_friends_tab_container_page/home_make_friends_tab_container_page.dart';
import 'package:flutter_maths_mingle_app/presentation/matches_screen/matches_screen.dart';
import 'package:flutter_maths_mingle_app/presentation/messages_page/messages_page.dart';
import '../../data/pref_data/pref_data.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'controller/bottombar_screen_controller.dart';

class BottomBarScreen extends StatefulWidget {
  BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarScreenController>(
      builder: (controller) {
        // ignore: deprecated_member_use
        return WillPopScope(
          onWillPop: () {
            if (PrefData.currentIndex == 0) {
              {
                exitDialogBox(context, controller);
                controller.update();
              }
            } else {
              PrefData.currentIndex = 0;
              controller.update();
            }
            return Future(() => false);
          },
          child: Scaffold(
              backgroundColor: AppColor.white,
              body: Center(
                child: pageList.elementAt(PrefData.currentIndex),
              ),
              bottomNavigationBar: CustomBottomBar()),
        );
      },
      init: BottomBarScreenController(),
    );
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

  List<Widget> pageList = [
    HomeMakeFriendsTabContainerPage(),
    //  DiscoverPage(),
    //   MatchesScreen(),
    MessagesPage(),
  ];
}
