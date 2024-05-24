import 'controller/app_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildAppNavigation(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          screenTitle: "1. Spash Screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.spashScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "1.1 Onboarding One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.onboardingOneScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "1.2 Onboarding Three".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.onboardingThreeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "1.3 Onboarding Three".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.onboardingThree1Screen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "2. Create Account - Phone Number".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.createAccountPhoneNumberScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "2.1 Create Account - OTP Code".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.createAccountOtpCodeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "2.2 Create Account - Name".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.createAccountNameScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "2.3 Create Account - Birthdate".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.createAccountBirthdateScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "2.4 Create Account - Gender".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.createAccountGenderScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "2.5 Create Account - Select Interest".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.createAccountSelectInterestScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "2.6 Create Account - Upload Photo".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.createAccountUploadPhotoScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "2.8 Login - Empty State".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.loginEmptyStateScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "2.9 Login - Active State".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.loginActiveStateScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "2.10 Login OTP Authentication".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.loginOtpAuthenticationScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "3. Home - Make Friends - Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.homeMakeFriendsContainerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "3.3 Home - Search Partners (Swipe Left) - Tab Container"
                                  .tr,
                          onTapScreenTitle: () => onTapScreenTitle(AppRoutes
                              .homeSearchPartnersSwipeLeftTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "4.1 Discover - Filter".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.discoverFilterScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "4.2 Interest - Scroll & Search clicked".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.interestScrollSearchClickedScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "4.2 Discover - Scroll & Search clicked".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.discoverScrollSearchClickedScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "4.3 Discover - by Interest vOne".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.discoverByInterestVoneScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "5. Match - Dating".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.matchDatingScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "5.1 Connect - Make Friends".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.connectMakeFriendsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "5.2 Matches".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.matchesScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "5.3 Dating - Profile Details vOne".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.datingProfileDetailsVoneScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "5.4 Dating - Profile Details vTwo".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.datingProfileDetailsVtwoScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "5.5 Dating - Profile Details vThree".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.datingProfileDetailsVthreeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "5.6 Dating - Profile Details Scroll".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.datingProfileDetailsScrollScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "5.7 Make Friends - Profile Details".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.makeFriendsProfileDetailsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle:
                              "5.8 Make Friends - Profile Details Scroll".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.makeFriendsProfileDetailsScrollScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "6.1 First Time Chat".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.firstTimeChatScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "6.1 First Time Chat One".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.firstTimeChatOneScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "6.3 Voice Chat Reply".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.voiceChatReplyScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "6.4 Text Chat".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.textChatScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "6.5 Text Chat Reply".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.textChatReplyScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "7.1 Edit Profile".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.editProfileScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "7.2 My Account ".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.myAccountScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "7.2 Language".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.languageScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "7.3 Settings".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.settingsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "7.3 Notifications".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.notificationsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "7.3 Privacy policy".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.privacyPolicyScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle({
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    Get.toNamed(routeName);
  }
}
