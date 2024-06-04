

import 'package:e_commerce_app/firebase_auth/firebase_auth_services.dart';

import '../../../core/app_export.dart';

class CreateAccountScreenController extends GetxController {
  AuthServices authServices=Get.find();
  var rxList = RxList<RxBool>.of(RxList.generate(3, (index) => false.obs));
  RxBool isVisible = false.obs;
  RxBool checkBox = false.obs;
  RxBool check = false.obs;

  void iSVisibleFun() {
    isVisible.toggle();
  }

  // Future<void> isLogin() async {
  //   rxList.assignAll([
  //     AuthService.nameController.text.isEmpty.obs,
  //     AuthService.phoneController.text.isEmpty.obs,
  //     AuthService.passwordController.text.isEmpty.obs,
  //   ]);
  //
  //   if (rxList.any((value) => value.value == true)) {
  //     // At least one field is empty
  //     // Additional logic to handle empty fields if needed
  //     if (kDebugMode) {
  //       print("At least one field is empty");
  //     }
  //   } else {
  //     // All fields are filled
  //     if (kDebugMode) {
  //       print("All fields are filled");
  //     }
  //     if (AuthService.phoneController.text.length < 10) {
  //       CustomSnackBar.showSnackBar(
  //           headerText: AppString.error,
  //           bodyText: AppString.pleaseMobileNumber);
  //     } else if (AuthService.passwordController.text.length < 8) {
  //       CustomSnackBar.showSnackBar(
  //           headerText: AppString.error, bodyText: AppString.pleaseEnterPin);
  //     } else if (checkBox.isFalse) {
  //       CustomSnackBar.showSnackBar(
  //           headerText: AppString.error,
  //           bodyText: AppString.pleaseCheckTermsAndCondition);
  //     } else {
  //       await AuthService.signInWithPhoneNumber(
  //           name: AuthService.nameController.text,
  //           password: AuthService.passwordController.text,
  //           phoneNumber: AuthService.phoneController.text);
  //     }
  //   }
  // }
}
