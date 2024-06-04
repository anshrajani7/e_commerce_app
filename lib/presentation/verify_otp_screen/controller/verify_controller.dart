// import 'package:asisto/FirebaseServices/firebase_services_api.dart';
// import 'package:asisto/core/app_export.dart';
// import 'package:asisto/widgets/custom_snackbar.dart';
//
// class VerifyScreenController extends GetxController {
//
//   var argument =Get.arguments;
//
//   String flag = '';
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//
//     if(argument!=null&&argument['flag']!=null){
//       flag = argument['flag'];
//     }
//
//   }
//
//   final TextEditingController otpController = TextEditingController();
//   Future<void> verifyOtp()async {
//     if(otpController.text.length<6){
//       CustomSnackBar.showSnackBar(headerText: AppString.error,bodyText: AppString.plaseEnterOtp);
//     }else {
//
//       if(flag=="FORGOTPASS"){
//         await AuthService.verifyOTPForForgotPassword(otpController.text);
//
//       }else{
//
//      await AuthService.verifyOTP(otpController.text);
//       }
//     }
//   }
//
// }
