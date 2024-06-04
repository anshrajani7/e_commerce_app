import 'package:e_commerce_app/core/app_export.dart';

abstract class AppStyle {
  /// Default font family
  static const String defaultFontOfApp = 'Inter';
  static const String _defaultFontFamily = defaultFontOfApp;
  static const FontWeight _defaultFontWeight = FontWeight.w400;
  static const TextDecoration decoration = TextDecoration.none;

  static TextStyle style(double size,
      {Color? fontColor,
      String? fontFamily,
      FontWeight? fontWeight,
      TextDecoration? decoration}) {
    const defaultFontColor = ColorConstant.textBlack;
    return TextStyle(
        fontFamily: fontFamily ?? _defaultFontFamily,
        fontSize: size,
        //12,
        fontWeight: fontWeight ?? _defaultFontWeight,
        color: fontColor ?? defaultFontColor,
        decorationColor: ColorConstant.primaryColor,
        decoration: decoration ?? decoration);
  }
}
