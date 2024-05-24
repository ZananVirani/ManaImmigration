import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefData {
  static String prefName = "com.fluttermathsmingleapp.app";
  static SharedPreferences? _sharedPreferences;

  PrefData() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  Future<SharedPreferences> get getPref async {
    return _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  static String keyCart = 'cardList';
  static String fevCart = 'favList';
  static String isIntro = 'intro';
  static String isLoc = 'Location';
  static String isProfilePic = 'ProfilePic';
  static String isSubProfile = 'SubProfilePic';
  static String isLogin = 'login';
  static String isInfo = 'info';
  static String isNotify = 'notification';
  static String isDakMode = '${prefName}darkMode';
  static String isClickMic = '${prefName}ClickMic';
  static String isClickKeyboard = '${prefName}ClickKeyboard';
  static String isMatched = '${prefName}isMatched';
  static String chatFirstTime = '${prefName}firstTimeChat';

  static Future<List<String>> getCartList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    return prefs.getStringList(keyCart) ?? [];
    // return  await prefs.getString('name')??'';
  }

  static setCartList(List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(keyCart, value);
  }

  static Future<List<String>> getFevList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    // return json.decode(prefs.getString(fevCart)!);
    return prefs.getStringList(fevCart) ?? [];
  }

  static setFevList(List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(fevCart, value);
  }

  static setIntro(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isIntro, value);
  }

  static Future<bool> getIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isIntro) ?? true;
  }

  static setChatFirstTime(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(chatFirstTime, value);
  }

  static Future<bool> getChatFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(chatFirstTime) ?? true;
  }

  static setMatched(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isMatched, value);
  }
  static Future<bool> getIsMatched() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isMatched) ?? false;
  }



  static setLoc(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isLoc, value);
  }

  static Future<bool> getLoc() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLoc) ?? true;
  }



  static setProfilePicPath(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(isProfilePic, value);
  }
  static Future<String> getProfilePicPath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(isProfilePic) ?? '';
  }

  static setSubProfile(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(isSubProfile, value);
  }
  static Future<String> getSubProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(isSubProfile) ?? '';
  }



  static setInfo(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isInfo, value);
  }

  static Future<bool> getInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isInfo) ?? true;
  }

  static setNotify(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isNotify, value);
  }

  static Future<bool> getNotify() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isNotify) ?? true;
  }

  static setLogin(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isLogin, value);
  }

  static Future<bool> getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLogin) ?? true;
  }

  static setPerson(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isLogin, value);
  }

  static Future<bool> getPerson() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLogin) ?? true;
  }

  static setDarkMode(bool? value) {
    _sharedPreferences!.setBool(isDakMode, value!);
  }

  static bool getDarkMode() {
    return _sharedPreferences!.getBool(isDakMode) ?? false;
  }


  static setClickMic(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isClickMic, value);
  }
  static Future<bool> getClickMic() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isClickMic) ?? true;
  }



  static setClickKeyboard(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isClickKeyboard, value);
  }
  static Future<bool> getClickKeyboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isClickKeyboard) ?? false;
  }


  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }

  static Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    return prefs.getString('email');
  }

  static Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('name');
  }

  static Future<String?> getLastname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('lastname');
  }

  static setNum() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('num', '(303) 555-0105');
  }

  static Future<String> getNum() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('num') ?? '';
  }

//  static  Future<String> getSurname() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //Return String
//     // return await prefs.getString('email')??'';
//     return  await prefs.getString('name')??'';
//
//
//
//
//
//
  static int currentIndex = 0;

  static getAppBar({
    SystemUiOverlayStyle? systemUiOverlayStyle,
    String? text,
    Color? color,
    double? toolbarHeight,
    TextStyle? textStyle,
    List<Widget>? action,
    Icon? leadingIcon,
    required void Function()? onTap,
    bool isLeadingIcon = false,
  }) {
    return AppBar(
      title: Text(
        text!,
        style:textStyle?? theme.textTheme.titleLarge!.copyWith(
          color: AppColor.black,
          fontWeight: FontWeight.w700,
        ),
      ),
      surfaceTintColor: AppColor.white,
      shadowColor: Color(0x34E7E4E4),


      
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      actions: action,
      leadingWidth: 60.h,
      leading: isLeadingIcon
          ? SizedBox(
              height: 0.h,
              width: 0.h,
            )
          : GestureDetector(
              onTap: () {
                Get.back();
                // CommonPop.popScreen(context, RoutesPath.loginScreen);
              },
              child: Container(
                margin: EdgeInsets.only(left: 24.h),
                padding: EdgeInsets.all(8.h),
                height: 40.h,
                width: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.lightGray,
                ),
                child: leadingIcon??CustomImageView(
                  imagePath: ImageConstant.arrowLeftIc,
                  fit: BoxFit.contain,
                
                )
              ),
            ),
      centerTitle: false,
      toolbarHeight: 70.h,
      elevation: 12.h,

      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: color ?? Colors.white,
    );
  }
//
//
// }
}
