import 'package:flex_color_scheme/flex_color_scheme.dart';

import '../app_export.dart';

class ColorConstant {
  static const Color primaryBlack = Color(0xFF000000);
  static const Color primaryBlackBottom = Color(0xff292a30);
  static const Color primaryColor = Color(0xFF704F38);
  static const Color categoryContainer = Color(0xFFF5DCBF);
  static const Color primaryGreen = Color(0xFF1dbf73);
  static const Color transparent = Colors.transparent;
  static const Color primaryBlue = Color(0xFF222663);
  static const Color textBlack = Color(0xFF303030);
  static const Color text00 = Color(0xFF000000);
  static const Color textRedFF = Color(0xFFFF0000);
  static const Color redFF2 = Color(0xFFFF2121);
  static const Color redF95 = Color(0xFFF95A37);
  static const Color greyE6E6 = Color(0xFFE6E6E6);
  static const Color greyD3 = Color(0xFFD3D3D3);
  static const Color greyF5 = Color(0xFFF5F5F5);
  static const Color primaryWhite = Color(0xFFFFFFFF);
  static const Color primaryWhiteContainer = Color(0xFFFAF5E6);
  static const Color primaryWhiteDark = Color(0xFF2B2B39);
  static const Color primaryYellow = Color(0xFFFFB628);
  static const Color backGroundColor = Color(0xFFF4F4F4);
  static const Color backGroundColorDark = Color(0xFF202029);
  static const Color grey4c4c = Color(0xFF4C4C4C);
  static const Color greyE2E2 = Color(0xFFE2E2E2);
  static const Color greyF5F4 = Color(0xFFF5F4F4);
  static const Color backGroundGreyColor = Color(0xFFE4E4E4);
  static const Color grey9DA = Color(0xFF9DA3AA);
  static const Color greyDCDC = Color(0xFFDCDCDC);

  static Color backgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? const Color(0xFFF4F4F4) // Light mode background color
        : const Color(0xFF202029); // Dark mode background color
  }

  static Color backgroundTextField(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? greyE2E2 // Light mode background color
        : primaryWhiteDark; // Dark mode background color
  }

  static Color containerBackGround(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? primaryWhite // Light mode background color
        : primaryWhiteDark; // Dark mode background color
  }

  static Color yellowToBlack(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? primaryYellow // Light mode background color
        : primaryBlack; // Dark mode background color
  }

  static Color textBlackToGreen(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? textBlack // Light mode background color
        : primaryGreen; // Dark mode background color
  }

  static Color textBlackToWhite(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? textBlack // Light mode background color
        : primaryWhite; // Dark mode background color
  }

  static Color textGreyToWhite(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? textBlack // Light mode background color
        : greyE6E6.withOpacity(0.6); // Dark mode background color
  }

  static Color textDarkTOLight(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? primaryGreen // Light mode background color
        : primaryWhite; // Dark mode background color
  }

  static Color textPrimaryBlackToWhite(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? primaryBlack // Light mode background color
        : primaryWhite; // Dark mode background color
  }

  static Color textGrey4c4cToYellow(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? grey4c4c // Light mode background color
        : greyE2E2; // Dark mode background color
  }

  static Color textGrey4c4cToWhite(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? grey4c4c // Light mode background color
        : primaryWhite; // Dark mode background color
  }

  static Color text00ToWhite(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? text00 // Light mode background color
        : primaryWhite; // Dark mode background color
  }

  static Color textblackToGreen(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? text00 // Light mode background color
        : primaryGreen; // Dark mode background color
  }
}

class CustomTheme {
  static ThemeData lightTheme(BuildContext context) {
    return FlexColorScheme.light(
      background: ColorConstant.primaryWhite.withOpacity(0.7),
      useMaterial3: true,
      appBarBackground: ColorConstant.backGroundColor,
      colors: FlexSchemeColor.from(
        brightness: Brightness.light,
        primary: ColorConstant.primaryWhite,
        secondary: ColorConstant.primaryBlue,
        appBarColor: ColorConstant.backGroundColor,
        swapOnMaterial3: true,
      ),
    ).toTheme;
  }

  static ThemeData darkTheme(BuildContext context) {
    return FlexColorScheme.dark(
      useMaterial3: true,
      appBarBackground: ColorConstant.backGroundColorDark,
      colors: FlexSchemeColor.from(
        primary: ColorConstant.primaryBlack,
        secondary: ColorConstant.primaryYellow,
        brightness: Brightness.dark,
        appBarColor: ColorConstant.backGroundColor,
        swapOnMaterial3: true,
      ),
    ).toTheme;
  }
}
