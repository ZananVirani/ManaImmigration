// // ignore_for_file: unnecessary_import

// import 'package:flutter_maths_mingle_app/core/app_export.dart';
// import 'package:flutter_maths_mingle_app/presentation/create_account_select_interest_screen/models/create_account_select_interest_model.dart';

// import '../../core/utils/image_constant.dart';
// import '../../presentation/create_account_gender_screen/models/create_account_gender_model.dart';
// import '../../presentation/home_make_friends_tab_container_page/models/users_story_model.dart';
// import '../../presentation/home_search_partners_page/models/home_search_partners_model.dart';
// // import '../../presentation/matches_screen/models/matche_person_list.dart';
// // import '../../presentation/matches_screen/models/userprofile3_item_model.dart';
// //import '../../presentation/onboarding_one_screen/models/onboarding_one_model.dart';

// class AppListData {
//   // static List<OnboardingOneModel> onboardingList = [
//   //   OnboardingOneModel(
//   //       img: ImageConstant.on1,
//   //       title: 'MatchMingle to the rescue',
//   //       details:
//   //           'Your love life, our expertis finding love is a journey let us guide you'),
//   //   OnboardingOneModel(
//   //       img: ImageConstant.on2,
//   //       title: 'Find your curry ently MatchMingle',
//   //       details:
//   //           'Looking for someone to make me laugh and explore the city with.'),
//   // ];

//   static List<CreateAccountGenderModel> genderList = [
//     CreateAccountGenderModel(gender: 'Male', genImg: ImageConstant.maleIcon),
//     CreateAccountGenderModel(
//         gender: 'Female', genImg: ImageConstant.femaleIcon),
//   ];
//   static List<CreateAccountSelectInterestModel> interestList = [
//     CreateAccountSelectInterestModel(inrerestName: 'Rap', isCheck: false),//Games
//     CreateAccountSelectInterestModel(inrerestName: 'Pop', isCheck: false),//Dancing
//     CreateAccountSelectInterestModel(inrerestName: 'Rock', isCheck: false),//Language
//     CreateAccountSelectInterestModel(inrerestName: 'Country', isCheck: false),//Music
//     CreateAccountSelectInterestModel(inrerestName: 'Metal', isCheck: false),//Movie
//     CreateAccountSelectInterestModel(inrerestName: 'Blues', isCheck: false),//Photography
//     CreateAccountSelectInterestModel(inrerestName: 'K-pop', isCheck: false),//Architecture
//     CreateAccountSelectInterestModel(inrerestName: 'Hip-hop', isCheck: false),//Fasion
//     CreateAccountSelectInterestModel(inrerestName: 'EDM', isCheck: false),//Book
//     CreateAccountSelectInterestModel(inrerestName: 'Classical', isCheck: false),//Writing
//     CreateAccountSelectInterestModel(inrerestName: 'Instrumental', isCheck: false), //Nature
//     CreateAccountSelectInterestModel(inrerestName: 'Lo-fi', isCheck: false),//Painting
//     CreateAccountSelectInterestModel(inrerestName: 'R&B', isCheck: false),//Football
//     CreateAccountSelectInterestModel(inrerestName: 'Folk', isCheck: false),//People
//     CreateAccountSelectInterestModel(inrerestName: 'Reggae', isCheck: false),//Animals
//     CreateAccountSelectInterestModel(inrerestName: 'Techno', isCheck: false),//Gym and fitness
//   ];

//   static List<UserStoryModel> usersStoryList = [
//     UserStoryModel(
//       userImage: ImageConstant.defualtUserIc,
//       userName: 'My story',
//     ),
//     UserStoryModel(
//       userImage: ImageConstant.userHansa,
//       userName: 'Hansa',
//     ),
//     UserStoryModel(
//       userImage: ImageConstant.userFlora,
//       userName: 'Flora',
//     ),
//     UserStoryModel(
//       userImage: ImageConstant.userVarian,
//       userName: 'Varian',
//     ),
//     UserStoryModel(
//       userImage: ImageConstant.userBrio,
//       userName: 'Brio nh',
//     ),
//     UserStoryModel(
//       userImage: ImageConstant.userHansa,
//       userName: 'Hansa',
//     ),
//     UserStoryModel(
//       userImage: ImageConstant.userFlora,
//       userName: 'Flora',
//     ),
//   ];

//   static List<CreateAccountSelectInterestModel> userPreference = [
//     CreateAccountSelectInterestModel(
//         inrerestName: 'Make friends', isCheck: false),
//     CreateAccountSelectInterestModel(inrerestName: 'Dating', isCheck: false),
//   ];

//   // static List<Userprofile3ItemModel> userMatchesList = [
//   //   Userprofile3ItemModel(
//   //       id: "1".obs,
//   //       distance: ImageConstant.imgRectangle24979.obs,
//   //       distanceLabel: "13 KM away".obs,
//   //       username: "Selena Bartlett".obs,
//   //       description: "Typesetting".obs),
//   //   Userprofile3ItemModel(
//   //       id: "2".obs,
//   //       distance: ImageConstant.imgRectangle24979158x154.obs,
//   //       distanceLabel: "25 KM away".obs,
//   //       username: "Eva Vance".obs,
//   //       description: "Savannah".obs),
//   //   Userprofile3ItemModel(
//   //       id: "3".obs,
//   //       distance: ImageConstant.imgRectangle249791.obs,
//   //       distanceLabel: "120 KM away".obs,
//   //       username: "Cooper Ford".obs,
//   //       description: "Dryer".obs),
//   //   Userprofile3ItemModel(
//   //       id: "4".obs,
//   //       distance: ImageConstant.imgRectangle249792.obs,
//   //       distanceLabel: "12 KM away".obs,
//   //       username: "Dominic Grimsh".obs,
//   //       description: "William".obs),
//   //   Userprofile3ItemModel(
//   //       id: "5".obs,
//   //       distance: ImageConstant.imgRectangle249793.obs,
//   //       distanceLabel: "13 KM away".obs,
//   //       username: "Angelina Sheean".obs,
//   //       description: "Typesetting".obs),
//   //   Userprofile3ItemModel(
//   //       id: "6".obs,
//   //       distance: ImageConstant.imgRectangle249794.obs,
//   //       distanceLabel: "13 KM away".obs,
//   //       username: "Taj Spears".obs,
//   //       description: "Typesetting".obs)
//   // ];

//   static List<SearchPartnersModel> searchPersonList = [
//     SearchPartnersModel(img: ImageConstant.tester),
//     SearchPartnersModel(img: ImageConstant.tester),
//     SearchPartnersModel(img: ImageConstant.tester),
//   ];

//   static List<MatchesPurchaseModel> matchesPurchaseList = [
//     MatchesPurchaseModel(purchaseText: 'Likes \$20.00'),
//     MatchesPurchaseModel(purchaseText: 'Connect \$25.00'),
//   ];

//   static List<String> planDuration = [
//     '1 Week',
//     '1 Month',
//   ];
//   static List<String> daysPerWeek = [
//     '5 Days',
//     '6 Days',
//     '7 Days',
//   ];
//   static List<String> selectMonth = [
//     'January',
//     'February',
//     'March',
//     'April',
//     'May',
//     'June',
//     'July',
//     'August',
//     'September',
//     'October',
//     'November',
//     'December',
//   ];
//   static List<String> numOfMeal = [
//     '1 Meals',
//     '2 Meals',
//     '3 Meals',
//     '4 Meals',
//     '5 Meals',
//   ];
//   static List<String> numOfSnaks = [
//     '1 Snacks',
//     '2 Snacks',
//     '3 Snacks',
//     '4 Snacks',
//     '5 Snacks',
//   ];
//   static List<String> numOfWeek = [
//     '1 Weeks',
//     '2 Weeks',
//     '3 Weeks',
//     '4 Weeks',
//     '5 Weeks',
//   ];
// }
