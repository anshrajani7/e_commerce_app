
import 'package:e_commerce_app/presentation/dash_bord_screen/binding/dash_bord_binding.dart';
import 'package:e_commerce_app/presentation/dash_bord_screen/dash_bord_screen.dart';
import 'package:e_commerce_app/presentation/login_screen/binding/login_creen_binding.dart';
import 'package:e_commerce_app/presentation/login_screen/login_screen.dart';
import 'package:get/get.dart';

import '../presentation/splash_screen/binding/splash_screen_binding.dart';
import '../presentation/splash_screen/splash_screen.dart';


class AppRoutes {
  static const String splashScreenRoute = '/splash_screen';
  static const String dashBordScreenRoute = '/dashBord_screen';
  static const String loginScreenRoute = '/login_screen';


  static List<GetPage> pages = [
    GetPage(
      name: splashScreenRoute,
      page: () => const SplashScreen(),
      bindings: [
        SplashScreenBinding(),
      ],
    ),
    GetPage(
      name: dashBordScreenRoute,
      page: () => const DashBordScreen(),
      bindings: [
        DashBordScreenBinding(),
      ],
    ),
    GetPage(
      name: loginScreenRoute,
      page: () =>  LoginScreen(),
      bindings: [
        LoginScreenBinding(),
      ],
    ),
];
}
