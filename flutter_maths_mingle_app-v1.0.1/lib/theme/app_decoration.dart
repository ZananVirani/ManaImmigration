import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray10001,
      );
  static BoxDecoration get fillGray100 => BoxDecoration(
        color: appTheme.gray100,
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );

  // Gradient decorations
  static BoxDecoration get gradientErrorContainerToErrorContainer =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.errorContainer,
            theme.colorScheme.errorContainer.withOpacity(0.54),
          ],
        ),
      );
  static BoxDecoration get gradientErrorContainerToErrorContainer1 =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.errorContainer.withOpacity(0.24),
            theme.colorScheme.errorContainer.withOpacity(0.58),
          ],
        ),
      );
  static BoxDecoration get gradientErrorContainerToErrorContainer2 =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.errorContainer,
            theme.colorScheme.errorContainer.withOpacity(0.41),
          ],
        ),
      );
  static BoxDecoration get gradientErrorContainerToErrorContainer3 =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.errorContainer,
            theme.colorScheme.errorContainer.withOpacity(0.54),
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineErrorContainer => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.errorContainer.withOpacity(0.07),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              5,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineGray => BoxDecoration(
        border: Border.all(
          color: appTheme.gray400,
          width: 3.h,
        ),
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: appTheme.gray10001,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );

  // White decorations
  static BoxDecoration get white => BoxDecoration(
        color: appTheme.whiteA700,
      );
  static BoxDecoration get whiteBottom => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onError,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              -4,
              -5,
            ),
          ),
        ],
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder16 => BorderRadius.circular(
        16.h,
      );
  static BorderRadius get circleBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get circleBorder30 => BorderRadius.circular(
        30.h,
      );
  static BorderRadius get circleBorder40 => BorderRadius.circular(
        40.h,
      );
  static BorderRadius get circleBorder58 => BorderRadius.circular(
        58.h,
      );
  static BorderRadius get circleBorder70 => BorderRadius.circular(
        70.h,
      );

  // Custom borders
  static BorderRadius get customBorderBL50 => BorderRadius.vertical(
        bottom: Radius.circular(50.h),
      );
  static BorderRadius get customBorderTL8 => BorderRadius.vertical(
        top: Radius.circular(8.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder24 => BorderRadius.circular(
        24.h,
      );
  static BorderRadius get roundedBorder33 => BorderRadius.circular(
        33.h,
      );
  static BorderRadius get roundedBorder37 => BorderRadius.circular(
        37.h,
      );
  static BorderRadius get roundedBorder48 => BorderRadius.circular(
        48.h,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
  static BorderRadius get roundedBorder81 => BorderRadius.circular(
        81.h,
      );
}

class AppColor {
  static Color primaryColor = Color.fromARGB(255, 15, 95, 1);
  static Color primaryLightColor = Color.fromARGB(255, 22, 17, 100);
  static Color secondaryLightColor = Color.fromARGB(255, 15, 95, 1);
  static Color secondaryULtaColor = Color.fromARGB(255, 71, 53, 192);
  static Color lightBorderColor = Color.fromARGB(255, 15, 95, 1);

  static Color black = const Color(0xFF000000);
  static Color prLight = const Color(0xFFFFFFFF);
  static Color black40 = const Color(0xFF696969);
  static Color black30 = const Color(0xFFC0C0C0);
  static Color black20 = const Color(0xFFDCDCDC);
  static Color black10 = const Color(0xFFF4F4F4);
  static Color white = const Color(0xFFffffff);
  static Color whiteLight = const Color(0x4DFFFFFF);
  static Color lightGray = const Color(0xFFF8F8F8);
  static Color gray = const Color(0xFFF1F1F1);

  static Color success = const Color(0xFF04B155);
  static Color main = const Color(0xFF5E9920);
  static Color error = const Color(0xFFD93636);

  static Color prDark = const Color(0xFF000000);
  static Color lightContainerDark = const Color(0xFF252525);
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
    