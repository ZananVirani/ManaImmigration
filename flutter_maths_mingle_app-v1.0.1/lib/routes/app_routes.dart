//import 'package:flutter_maths_mingle_app/presentation/home_search_partners_page/binding/home_search_partners_binding.dart';
//import 'package:flutter_maths_mingle_app/presentation/profile_page/binding/profile_binding.dart';
import 'package:flutter_maths_mingle_app/presentation/create_account_select_interest_screen/binding/create_account_select_interest_binding.dart';
import 'package:flutter_maths_mingle_app/presentation/create_account_select_interest_screen/create_account_select_interest_screen.dart';
import 'package:flutter_maths_mingle_app/presentation/noConnectionPage/noConnection.dart';
import 'package:flutter_maths_mingle_app/presentation/spash_screen/spash_screen.dart';
import 'package:flutter_maths_mingle_app/presentation/spash_screen/binding/spash_binding.dart';
// import 'package:flutter_maths_mingle_app/presentation/onboarding_one_screen/onboarding_one_screen.dart';
// import 'package:flutter_maths_mingle_app/presentation/onboarding_one_screen/binding/onboarding_one_binding.dart';
import 'package:flutter_maths_mingle_app/presentation/onboarding_three1_screen/onboarding_three1_screen.dart';
import 'package:flutter_maths_mingle_app/presentation/onboarding_three1_screen/binding/onboarding_three1_binding.dart';
// import 'package:flutter_maths_mingle_app/presentation/create_account_phone_number_screen/create_account_phone_number_screen.dart';
// import 'package:flutter_maths_mingle_app/presentation/create_account_phone_number_screen/binding/create_account_phone_number_binding.dart';
// import 'package:flutter_maths_mingle_app/presentation/create_account_otp_code_screen/create_account_otp_code_screen.dart';
// import 'package:flutter_maths_mingle_app/presentation/create_account_otp_code_screen/binding/create_account_otp_code_binding.dart';
// import 'package:flutter_maths_mingle_app/presentation/create_account_name_screen/create_account_name_screen.dart';
// import 'package:flutter_maths_mingle_app/presentation/create_account_name_screen/binding/create_account_name_binding.dart';
import 'package:flutter_maths_mingle_app/presentation/create_account_birthdate_screen/create_account_birthdate_screen.dart';
import 'package:flutter_maths_mingle_app/presentation/create_account_birthdate_screen/binding/create_account_birthdate_binding.dart';
// import 'package:flutter_maths_mingle_app/presentation/create_account_gender_screen/create_account_gender_screen.dart';
//import 'package:flutter_maths_mingle_app/presentation/create_account_gender_screen/binding/create_account_gender_binding.dart';
// import 'package:flutter_maths_mingle_app/presentation/create_account_select_interest_screen/create_account_select_interest_screen.dart';
//import 'package:flutter_maths_mingle_app/presentation/create_account_select_interest_screen/binding/create_account_select_interest_binding.dart';
// import 'package:flutter_maths_mingle_app/presentation/create_account_upload_photo_screen/create_account_upload_photo_screen.dart';
// import 'package:flutter_maths_mingle_app/presentation/create_account_upload_photo_screen/binding/create_account_upload_photo_binding.dart';
//import 'package:flutter_maths_mingle_app/presentation/home_make_friends_container_screen/home_make_friends_container_screen.dart';
// import 'package:flutter_maths_mingle_app/presentation/discover_filter_screen/discover_filter_screen.dart';
//import 'package:flutter_maths_mingle_app/presentation/discover_filter_screen/binding/discover_filter_binding.dart';
// import 'package:flutter_maths_mingle_app/presentation/discover_scroll_search_clicked_screen/discover_scroll_search_clicked_screen.dart';
// import 'package:flutter_maths_mingle_app/presentation/discover_scroll_search_clicked_screen/binding/discover_scroll_search_clicked_binding.dart';
// import 'package:flutter_maths_mingle_app/presentation/discover_by_interest_vone_screen/discover_by_interest_vone_screen.dart';
// import 'package:flutter_maths_mingle_app/presentation/discover_by_interest_vone_screen/binding/discover_by_interest_vone_binding.dart';
// import 'package:flutter_maths_mingle_app/presentation/matches_screen/matches_screen.dart';
// import 'package:flutter_maths_mingle_app/presentation/matches_screen/binding/matches_binding.dart';
// import 'package:flutter_maths_mingle_app/presentation/first_time_chat_screen/first_time_chat_screen.dart';
// import 'package:flutter_maths_mingle_app/presentation/first_time_chat_screen/binding/first_time_chat_binding.dart';
// import 'package:flutter_maths_mingle_app/presentation/edit_profile_screen/edit_profile_screen.dart';
// import 'package:flutter_maths_mingle_app/presentation/edit_profile_screen/binding/edit_profile_binding.dart';
// import 'package:flutter_maths_mingle_app/presentation/my_account_screen/my_account_screen.dart';
// import 'package:flutter_maths_mingle_app/presentation/my_account_screen/binding/my_account_binding.dart';
import 'package:flutter_maths_mingle_app/presentation/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:flutter_maths_mingle_app/presentation/privacy_policy_screen/binding/privacy_policy_binding.dart';
import 'package:flutter_maths_mingle_app/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:flutter_maths_mingle_app/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

import '../presentation/bottombar_screen/binding/bottombar_screen_binding.dart';
import '../presentation/bottombar_screen/bottombar_screen.dart';
//import '../presentation/profile_page/profile_page.dart';

class AppRoutes {
  static const String spashScreen = '/spash_screen';

  //static const String onboardingOneScreen = '/onboarding_one_screen';

  static const String onboardingThreeScreen = '/onboarding_three_screen';

  static const String onboardingThree1Screen = '/onboarding_three1_screen';

  static const String createAccountPhoneNumberScreen =
      '/create_account_phone_number_screen';

  static const String createAccountOtpCodeScreen =
      '/create_account_otp_code_screen';

  static const String createAccountNameScreen = '/create_account_name_screen';

  static const String createAccountBirthdateScreen =
      '/create_account_birthdate_screen';

  static const String createAccountGenderScreen =
      '/create_account_gender_screen';

  static const String createAccountSelectInterestScreen =
      '/create_account_select_interest_screen';

  static const String createAccountUploadPhotoScreen =
      '/create_account_upload_photo_screen';

  static const String loginEmptyStateScreen = '/login_empty_state_screen';

  static const String loginActiveStateScreen = '/login_active_state_screen';

  static const String loginOtpAuthenticationScreen =
      '/login_otp_authentication_screen';

  static const String bottomBarScreen = '/BottomBarScreen';

  static const String homeMakeFriendsPage = '/home_make_friends_page';

  static const String homeMakeFriendsTabContainerPage =
      '/home_make_friends_tab_container_page';

  static const String homeMakeFriendsContainerScreen =
      '/home_make_friends_container_screen';

  static const String homeSearchPartnersPage = '/home_search_partners_page';

  static const String homeSearchPartnersSwipeRightPage =
      '/home_search_partners_swipe_right_page';

  static const String homeSearchPartnersSwipeLeftPage =
      '/home_search_partners_swipe_left_page';

  static const String homeSearchPartnersSwipeLeftTabContainerScreen =
      '/home_search_partners_swipe_left_tab_container_screen';

  static const String discoverPage = '/discover_page';

  static const String discoverFilterScreen = '/discover_filter_screen';

  static const String interestScrollSearchClickedScreen =
      '/interest_scroll_search_clicked_screen';

  static const String discoverScrollSearchClickedScreen =
      '/discover_scroll_search_clicked_screen';

  static const String discoverByInterestVoneScreen =
      '/discover_by_interest_vone_screen';

  static const String matchDatingScreen = '/match_dating_screen';

  static const String connectMakeFriendsScreen = '/connect_make_friends_screen';

  static const String matchesScreen = '/matches_screen';

  static const String datingProfileDetailsVoneScreen =
      '/dating_profile_details_vone_screen';

  static const String datingProfileDetailsVtwoScreen =
      '/dating_profile_details_vtwo_screen';

  static const String noConnectionPage = '/dating_profile_details_vtwo_screen';

  static const String datingProfileDetailsVthreeScreen =
      '/dating_profile_details_vthree_screen';

  static const String datingProfileDetailsScrollScreen =
      '/dating_profile_details_scroll_screen';

  static const String makeFriendsProfileDetailsScreen =
      '/make_friends_profile_details_screen';

  static const String makeFriendsProfileDetailsScrollScreen =
      '/make_friends_profile_details_scroll_screen';

  static const String messagesPage = '/messages_page';

  static const String firstTimeChatScreen = '/first_time_chat_screen';

  static const String firstTimeChatOneScreen = '/first_time_chat_one_screen';

  static const String voiceChatReplyScreen = '/voice_chat_reply_screen';

  static const String textChatScreen = '/text_chat_screen';

  static const String textChatReplyScreen = '/text_chat_reply_screen';

  static const String profilePage = '/profile_page';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String myAccountScreen = '/my_account_screen';

  static const String languageScreen = '/language_screen';

  static const String settingsScreen = '/settings_screen';

  static const String notificationsScreen = '/notifications_screen';

  static const String privacyPolicyScreen = '/privacy_policy_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: spashScreen,
      page: () => SpashScreen(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
      bindings: [
        SpashBinding(),
      ],
    ),
    // GetPage(
    //   name: onboardingOneScreen,
    //   page: () => OnboardingOneScreen(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),

    //   bindings: [
    //     OnboardingOneBinding(),
    //   ],

    GetPage(
      name: onboardingThree1Screen,
      page: () => OnboardingThree1Screen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(seconds: 1),
      bindings: [
        OnboardingThree1Binding(),
      ],
    ),
    GetPage(
      name: noConnectionPage,
      page: () => NoConnectionPage(),
      transition: Transition.upToDown,
      transitionDuration: Duration(milliseconds: 500),
      bindings: [],
    ),
    // GetPage(
    //   name: createAccountPhoneNumberScreen,
    //   page: () => CreateAccountPhoneNumberScreen(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     CreateAccountPhoneNumberBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: createAccountOtpCodeScreen,
    //   page: () => CreateAccountOtpCodeScreen(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     CreateAccountOtpCodeBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: createAccountNameScreen,
    //   page: () => CreateAccountNameScreen(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     CreateAccountNameBinding(),
    //   ],
    // ),
    GetPage(
      name: createAccountBirthdateScreen,
      page: () => CreateAccountBirthdateScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(seconds: 1),
      bindings: [
        CreateAccountBirthdateBinding(),
      ],
    ),
    // GetPage(
    //   name: createAccountGenderScreen,
    //   page: () => CreateAccountGenderScreen(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     CreateAccountGenderBinding(),
    //   ],
    // ),
    GetPage(
      name: createAccountSelectInterestScreen,
      page: () => CreateAccountSelectInterestScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(seconds: 1),
      bindings: [
        CreateAccountSelectInterestBinding(),
      ],
    ),
    // GetPage(
    //   name: createAccountUploadPhotoScreen,
    //   page: () => CreateAccountUploadPhotoScreen(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     CreateAccountUploadPhotoBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: loginEmptyStateScreen,
    //   page: () => LoginEmptyStateScreen(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     LoginEmptyStateBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: loginActiveStateScreen,
    //   page: () => LoginActiveStateScreen(),
    //   bindings: [
    //     LoginActiveStateBinding(),
    //   ],
    // ),

    // GetPage(
    //   name: loginOtpAuthenticationScreen,
    //   page: () => LoginOtpAuthenticationScreen(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     LoginOtpAuthenticationBinding(),
    //   ],
    // ),
    GetPage(
      name: bottomBarScreen,
      page: () => BottomBarScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(seconds: 1),
      bindings: [
        BottomBarScreenBinding(),
      ],
    ),
    // GetPage(
    //   name: homeMakeFriendsContainerScreen,
    //   page: () => HomeSearchPartnersPage(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     HomeMakeFriendsContainerBinding(),
    //   ],
    // ),

    // GetPage(
    //   name: discoverFilterScreen,
    //   page: () => DiscoverFilterScreen(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     DiscoverFilterBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: interestScrollSearchClickedScreen,
    //   page: () => InterestScrollSearchClickedScreen(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     InterestScrollSearchClickedBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: discoverScrollSearchClickedScreen,
    //   page: () => DiscoverScrollSearchClickedScreen(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     DiscoverScrollSearchClickedBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: discoverByInterestVoneScreen,
    //   page: () => DiscoverByInterestVoneScreen(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     DiscoverByInterestVoneBinding(),
    //   ],
    // ),

    // GetPage(
    //   name: connectMakeFriendsScreen,
    //   page: () => ConnectMakeFriendsScreen(),
    //   bindings: [
    //     ConnectMakeFriendsBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: matchesScreen,
    //   page: () => MatchesScreen(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     MatchesBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: datingProfileDetailsVoneScreen,
    //   page: () => DatingProfileDetailsVoneScreen(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     DatingProfileDetailsVoneBinding(),
    //   ],
    // ),

    // GetPage(
    //   name: datingProfileDetailsScrollScreen,
    //   page: () => DatingProfileDetailsScrollScreen(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     DatingProfileDetailsScrollBinding(),
    //   ],
    // ),

    // GetPage(
    //   name: firstTimeChatScreen,
    //   page: () => FirstTimeChatScreen(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     FirstTimeChatBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: firstTimeChatOneScreen,
    //   page: () => FirstTimeChatOneScreen(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     FirstTimeChatOneBinding(),
    //   ],
    // ),

    // GetPage(
    //   name: editProfileScreen,
    //   page: () => EditProfileScreen(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     EditProfileBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: myAccountScreen,
    //   page: () => MyAccountScreen(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     MyAccountBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: languageScreen,
    //   page: () => LanguageScreen(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     LanguageBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: profilePage,
    //   page: () => ProfilePage(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     ProfileBinding(),
    //   ],
    // ),

    // GetPage(
    //   name: settingsScreen,
    //   page: () => SettingsScreen(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     SettingsBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: notificationsScreen,
    //   page: () => NotificationsScreen(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(seconds: 1),
    //   bindings: [
    //     NotificationsBinding(),
    //   ],
    // ),
    GetPage(
      name: privacyPolicyScreen,
      page: () => PrivacyPolicyScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(seconds: 1),
      bindings: [
        PrivacyPolicyBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(seconds: 1),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SpashScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
      bindings: [
        SpashBinding(),
      ],
    ),
  ];
}
