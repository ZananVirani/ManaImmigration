import 'package:flutter/cupertino.dart';
import 'package:Melofy/API/api_calls.dart';
import 'package:Melofy/authorization/spotify_auth.dart';
import 'package:Melofy/data/pref_data/pref_data.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:flutter/material.dart';
import 'package:Melofy/core/app_export.dart';
import 'package:Melofy/widgets/custom_elevated_button.dart';

/**
 * Class to show the onboarding screen, with an image and a button to login with Spotify
 */
class OnboardingThree1Screen extends StatefulWidget {
  const OnboardingThree1Screen({super.key});

  @override
  State<OnboardingThree1Screen> createState() => _OnboardingThree1ScreenState();
}

/**
 * State class for the onboarding screen.
 */
class _OnboardingThree1ScreenState extends State<OnboardingThree1Screen> {
  // Variable to show the error message or not
  bool showErrorMessage = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        child: Scaffold(
            backgroundColor: appTheme.secondaryColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Image at the top of the screen
                CustomImageView(
                  imagePath: ImageConstant.onBoard,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.v),
                        child: Text('Music for You,\nPicked by You',
                            style: theme.textTheme.headlineMedium,
                            textAlign: TextAlign.center)),
                    // Button to login with Spotify
                    CustomElevatedButton(
                      text: 'Login with Spotify   ',
                      margin: EdgeInsets.only(
                          left: 24.h, right: 24.h, bottom: 30.h),
                      onPressed: () async {
                        try {
                          // Get the user to authenticate with Spotify, and get the access token
                          AccessTokenResponse? accessToken =
                              await SpotifyAuthService.getAccessToken();

                          if (!(accessToken is AccessTokenResponse))
                            throw Exception();

                          // store this token in the shared preferences, and make all the necessary API calls
                          await PrefData.setAccessToken(accessToken);
                          await PrefData.setRefreshToken(accessToken);
                          await PrefData.setIntro(false);
                          await MakeAPICall.refreshName();
                          await Get.offAndToNamed(
                              AppRoutes.createAccountSelectInterestScreen);
                        } catch (e) {
                          // If the user did not authenticate, show an error message
                          showCupertinoDialog(
                              context: context, builder: createDialog);
                          setState(() {
                            showErrorMessage = true;
                          });
                        }
                      },
                      buttonStyle: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
                        elevation: 0.h,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.h),
                        ),
                      ),
                      buttonTextStyle: CustomTextStyles.titleMediumWhiteA70017,
                      height: 90.v,
                      rightIcon: Brand(
                        Brands.spotify,
                      ),
                    ),
                  ],
                )
              ],
            ),
            bottomNavigationBar: _buildLoginFrame(showErrorMessage)),
      ),
    );
  }

  /**
   * Function to create the dialog box to show the error message if the user 
   * did not authenticate with Spotify.
   */
  Widget createDialog(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text("Authorization needed to continue"),
      actions: [
        CupertinoDialogAction(
          child: Text("Ok"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }

  /**
   * Function to build the frame at the bottom of the screen, which shows the error message
   * if the user does not authenticate with Spotify.
   */
  Widget _buildLoginFrame(bool showErrorMessage) {
    return Padding(
        padding: EdgeInsets.only(bottom: 24.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.only(bottom: 4.v),
              child: showErrorMessage
                  ? RichText(
                      text: TextSpan(
                          text: "Please Authorize in order \nto access Melofy.",
                          style: CustomTextStyles.titleMediumRed500),
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      "Must have a Spotify Account to access Melofy.",
                      style: CustomTextStyles.titleSmallPrimary,
                    ))
        ]));
  }
}
