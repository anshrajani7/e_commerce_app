// import 'package:asisto/FirebaseServices/firebase_services_api.dart';
// import 'package:asisto/core/app_export.dart';
// import 'package:asisto/presentation/verify_otp_screen/controller/verify_controller.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:pin_input_text_field/pin_input_text_field.dart';
//
// class VerifyScreen extends GetWidget<VerifyScreenController> {
//   const VerifyScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConstant.backgroundColor(context),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: getWidth(20),vertical: getHeight(45)),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Bounce(
//                     onTap: (){
//                       Get.back();
//                     },
//                     child: Container(
//                       height: getHeight(55),
//                       width: getHeight(55),
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                               color: ColorConstant.greyD3, width: 1)),
//                       child:  const Center(
//                         child: Icon(
//                           Icons.arrow_back,
//                           color: ColorConstant.primaryBlack,
//                           size: 25,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Gap(getHeight(30)),
//               Text(
//                 AppString.verifyCode,
//                 style: AppStyle.style(getFontSize(28),
//                     fontColor: ColorConstant.primaryBlack,
//                     fontWeight: FontWeight.w500),
//               ),
//               Gap(getHeight(5)),
//
//               Text(
//                 AppString.pleaseEnterTheCode,
//                 style: AppStyle.style(getFontSize(14),
//                     fontColor: ColorConstant.primaryBlack.withOpacity(0.6),
//                     fontWeight: FontWeight.w400),
//               ),
//              Text(
//                     AuthService.phoneController.text,
//                   style: AppStyle.style(getFontSize(14),
//                       fontColor: ColorConstant.primaryColor,
//                       fontWeight: FontWeight.w500),
//                 ),
//               Gap(getHeight(30)),
//
//               PinInputTextField(
//                 pinLength: 6,
//                 toolbarOptions: ToolbarOptions.empty,
//                 autocorrect: true,
//                 cursor: Cursor(
//                     color: ColorConstant.primaryColor,
//                     height: 2,
//                     width: 10,
//                     enabled: false),
//                 controller: controller.otpController,
//                 autoFocus: true,
//                 textInputAction: TextInputAction.done,
//                 keyboardType: TextInputType.number,
//                 decoration: BoxLooseDecoration(
//                   radius: const Radius.circular(35),
//                   hintText: '------',
//                   gapSpace: 5,
//                   strokeWidth: 1.5,
//                   hintTextStyle: AppStyle.style(18,
//                       fontColor: ColorConstant.primaryColor,
//                       fontWeight: FontWeight.bold),
//                   strokeColorBuilder:
//                       const FixedColorBuilder(ColorConstant.primaryColor),
//                 ),
//                 onSubmit: (pin) {
//                   // Handle the submitted OTP
//                   if (kDebugMode) {
//                     print('Entered OTP: $pin');
//                   }
//                 },
//               ),
//               Gap(getHeight(30)),
//
//               Text(
//                 AppString.didtRecive,
//                 style: AppStyle.style(getFontSize(14),
//                     fontColor: ColorConstant.primaryBlack.withOpacity(0.6),
//                     fontWeight: FontWeight.w400),
//               ),
//               Text(
//                 AppString.resendCode,
//                 style: AppStyle.style(getFontSize(14),
//                     fontColor: ColorConstant.primaryColor,
//                     fontWeight: FontWeight.w600,
//                 decoration: TextDecoration.underline),
//               ),
//               Gap(getHeight(30)),
//
//               Obx(()=> AppElevatedButton(isLoading: AuthService.isApiLoading.value,buttonName: AppString.verify, onPressed: (){controller.verifyOtp();}))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
