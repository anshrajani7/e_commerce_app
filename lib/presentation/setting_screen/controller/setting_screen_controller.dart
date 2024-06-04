// import 'package:asisto/core/app_export.dart';
//
// import '../../../core/utils/app_prefs_key.dart';
//
// class SettingScreenController extends GetxController {
//   Rx<Type> type = Type.stop.obs;
//   RxBool hasLightDark = false.obs;
//   Rx<ThemeMode> currentTheme = ThemeMode.system.obs;
//
//   @override
//   void onInit() {
//     bool isLight =
//         CommonConstant.instance.dbHelper.box.get(HiveKey.isDarkMode) ?? true;
//     currentTheme.value = isLight ? ThemeMode.light : ThemeMode.dark;
//     super.onInit();
//   }
//
//   // function to switch between themes
//   void switchTheme() {
//     currentTheme.value = currentTheme.value == ThemeMode.light
//         ? ThemeMode.dark
//         : ThemeMode.light;
//     CommonConstant.instance.dbHelper.box
//         .put(HiveKey.isDarkMode, currentTheme.value == ThemeMode.light);
//   }
// }
//
// enum Type { stop, over }
