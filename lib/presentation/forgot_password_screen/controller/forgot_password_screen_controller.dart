

import '../../../core/app_export.dart';

class ForgotPasswordScreenController extends GetxController {
  TextEditingController mobileController = TextEditingController();
  var rxList = RxList<RxBool>.of(RxList.generate(2, (index) => false.obs));
  RxBool isVisible = false.obs;
  RxBool check = false.obs;

  // Future<void> isLogin()async {
  //   rxList.assignAll([
  //     mobileController.text.isEmpty.obs,
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
  //     // Navigate to the next screen here
  //     if (mobileController.text.length < 10) {
  //       CustomSnackBar.showSnackBar(
  //           headerText: AppString.error, bodyText: AppString.pleaseMobileNumber);
  //     }  else {
  //       // ProgressDialogUtils.showProgressDialog();
  //       await AuthService.forgotPassword(phoneNumber: mobileController.text,);
  //
  //     }
  //   }
  // }

  void iSVisibleFun() {
    isVisible.toggle();
  }


  void handelRoute(bool isTrue){
    if(isTrue){

    }
  }
}
