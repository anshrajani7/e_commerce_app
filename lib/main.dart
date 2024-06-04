import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/firebase_auth/firebase_auth_services.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/app_export.dart';
import 'core/services/bindings_service/bindings_service.dart';
import 'core/services/cache_storage/cache_storage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheStorageService.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings =
  const Settings(persistenceEnabled: false);
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.debug,
  );
  AuthServices authController = Get.put(
    AuthServices(),
    permanent: true,
  );

  await authController.reloadUserData();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 AuthServices authServices = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsService(),
      color: ColorConstant.primaryWhite,
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.splashScreenRoute,

    );
  }

  // Widget getHomePage() {
  //   var userModel = authServices.userModel;
  //   if (authServices.userModel.value.id.isEmpty) {
  //     return const SplashView();
  //   } else if (userModel.value.phoneModel.internationalNumber.isEmpty &&
  //       userModel.value.status != Constants.completed) {
  //     return const PhoneVerificationScreen(
  //       isLoginWithPhone: false,
  //       isRegister: true,
  //       isAdd: false,
  //     );
  //   }
  //   return const HomeScreen();
  // }
}

