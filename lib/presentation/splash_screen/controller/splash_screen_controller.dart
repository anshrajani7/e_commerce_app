import 'dart:async';

import 'package:e_commerce_app/firebase_auth/firebase_auth_services.dart';

import '../../../core/app_export.dart';

class SplashScreenController extends GetxController {
  RxBool isLoading=false.obs;
  AuthServices authServices= Get.find();
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     onInitFunction();
    });
  }
  Future<void>  onInitFunction()async{
    await _checkNetworkStatus();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    isLoading.value = getLoading();
  }



  Future<void> _checkNetworkStatus() async {
      routeScreen();
  }

  Future<void> routeScreen() async {
    try {
      await Future.delayed(const Duration(seconds: 3)).then((value) async {

        final String routeName = isLoading.value
            ? AppRoutes.dashBordScreenRoute
            : AppRoutes.loginScreenRoute;

        await Get.offAllNamed(routeName);
      });
    } catch (e) {
      // Handle any potential errors during the async operation
      if (kDebugMode) {
        print('Error in routeScreen: $e');
      }
    }
  }
bool getLoading() {
  if (authServices.userModel.value.id.isEmpty) {
    return false;
  } else  {
    return true;
  }
}
}
