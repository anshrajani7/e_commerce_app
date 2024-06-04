// import 'package:asisto/FirebaseServices/firebase_service.dart';
// import 'package:asisto/FirebaseServices/firebase_services_api.dart';
// import 'package:asisto/core/app_export.dart';
// import 'package:asisto/widgets/custom_snackbar.dart';
//
// class NewPasswordScreenController extends GetxController {
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   var rxList = RxList<RxBool>.of(RxList.generate(2, (index) => false.obs));
//   var rxListConfirm = RxList<RxBool>.of(RxList.generate(2, (index) => false.obs));
//   RxBool isVisible = false.obs;
//   RxBool isVisibleConfirm = false.obs;
//   RxBool check = false.obs;
//
//   Future<void> updatePassWithValidation() async {
//
//     if(passwordController.text.isEmpty){
//       CustomSnackBar.showSnackBar(
//           headerText: AppString.error, bodyText:"Please enter password!");
//     }else if(passwordController.text.length < 8){
//       CustomSnackBar.showSnackBar(
//           headerText: AppString.error, bodyText:AppString.pleaseEnterPin);
//     }else if(confirmPasswordController.text.isEmpty){
//       CustomSnackBar.showSnackBar(
//           headerText: AppString.error, bodyText:"Please enter confirm password!");
//     } else if(passwordController.text!=confirmPasswordController.text){
//       CustomSnackBar.showSnackBar(
//           headerText: AppString.error, bodyText:"Your password and confirm password do not match!");
//     }else{
//     await AuthService.updateNewPassword(password: passwordController.text);
//     }
//
//   }
//
//   void iSVisibleFun() {
//     isVisible.toggle();
//   }
//   void iSVisibleConfirmFun() {
//     isVisibleConfirm.toggle();
//   }
//
//
//   void handelRoute(bool isTrue){
//     if(isTrue){
//
//     }
//   }
// }
