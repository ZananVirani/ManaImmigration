import 'package:flutter/material.dart';
import 'package:Melofy/core/app_export.dart';
import 'package:Melofy/data/pref_data/pref_data.dart';

/**
 * Page to show when there is no internet connection
 */
class NoConnectionPage extends StatelessWidget {
  const NoConnectionPage({super.key});

  /**
   * Build method to create the UI of the page, with a WiFI off icon, a title and a message
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryLightColor,
      body: Center(
        child: AlertDialog(
          elevation: 5.0,
          icon: Icon(Icons.wifi_off,
              size: 120.adaptSize, color: AppColor.secondaryLightColor),
          title: Text("Uh oh! Something went wrong!",
              style: CustomTextStyles.bodyLargeGray700),
          content: Text(
            "Please check connect to the internet and press continue.",
            style: CustomTextStyles.bodyMediumBlack600,
            textAlign: TextAlign.center,
          ),
          actions: [
            GestureDetector(
              child: Center(
                  child: Text(
                "Continue",
                style: TextStyle(
                    fontSize: 18.fSize,
                    backgroundColor: AppColor.lightGray,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold),
              )),
              onTap: () async {
                bool isIntro = await PrefData.getIntro();
                bool isLogin = await PrefData.getLogin();

                var connectivityList = await Connectivity().checkConnectivity();

                // Route the user to the appropriate page based on the user's connection state
                if (connectivityList.contains(ConnectivityResult.none))
                  Get.offAndToNamed(AppRoutes.noConnectionPage);
                else {
                  if (isIntro)
                    Get.offAndToNamed(AppRoutes.onboardingThree1Screen);
                  else if (isLogin)
                    Get.offAndToNamed(
                        AppRoutes.createAccountSelectInterestScreen);
                  else
                    Get.offAndToNamed(AppRoutes.bottomBarScreen);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
