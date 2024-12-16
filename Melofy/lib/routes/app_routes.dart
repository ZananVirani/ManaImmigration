import 'package:Melofy/presentation/create_account_select_interest_screen/binding/create_account_select_interest_binding.dart';
import 'package:Melofy/presentation/create_account_select_interest_screen/create_account_select_interest_screen.dart';
import 'package:Melofy/presentation/noConnectionPage/noConnection.dart';
import 'package:Melofy/presentation/spash_screen/spash_screen.dart';
import 'package:Melofy/presentation/spash_screen/binding/spash_binding.dart';
import 'package:Melofy/presentation/onboarding_three1_screen/onboarding_three1_screen.dart';
import 'package:Melofy/presentation/onboarding_three1_screen/binding/onboarding_three1_binding.dart';
import 'package:get/get.dart';
import '../presentation/bottombar_screen/binding/bottombar_screen_binding.dart';
import '../presentation/bottombar_screen/bottombar_screen.dart';

/**
 * Class that defines all of the app routes.
 */
class AppRoutes {
  // Constants for routes
  static const String spashScreen = '/spash_screen';
  static const String onboardingThree1Screen = '/onboarding_three1_screen';
  static const String createAccountSelectInterestScreen =
      '/create_account_select_interest_screen';
  static const String bottomBarScreen = '/BottomBarScreen';
  static const String noConnectionPage = '/dating_profile_details_vtwo_screen';
  static const String initialRoute = '/initialRoute';

  // List of all the pages
  static List<GetPage> pages = [
    GetPage(
      // Splash Screen
      name: spashScreen,
      page: () => SpashScreen(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
      bindings: [
        SpashBinding(),
      ],
    ),
    GetPage(
      // Onboarding Screen
      name: onboardingThree1Screen,
      page: () => OnboardingThree1Screen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(seconds: 1),
      bindings: [
        OnboardingThree1Binding(),
      ],
    ),
    GetPage(
      // No Connection Page
      name: noConnectionPage,
      page: () => NoConnectionPage(),
      transition: Transition.upToDown,
      transitionDuration: Duration(milliseconds: 500),
      bindings: [],
    ),
    GetPage(
      // Genre Selection Screen
      name: createAccountSelectInterestScreen,
      page: () => CreateAccountSelectInterestScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(seconds: 1),
      bindings: [
        CreateAccountSelectInterestBinding(),
      ],
    ),
    GetPage(
      // Overall Screen Container, holds bottom nav bar.
      name: bottomBarScreen,
      page: () => BottomBarScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(seconds: 1),
      bindings: [
        BottomBarScreenBinding(),
      ],
    ),
    GetPage(
      // Initial Route (Splash Screen)
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
