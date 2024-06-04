// import 'package:asisto/ApiServices/api_service.dart';
// import 'package:asisto/FirebaseServices/firebase_services_api.dart';
// import 'package:asisto/core/app_export.dart';
// import 'package:asisto/presentation/forgot_password_screen/controller/forgot_password_screen_controller.dart';
// import 'package:asisto/presentation/login_screen/controller/login_screen_controller.dart';
// import 'package:asisto/presentation/new_password_screen/controller/new_password_screen_controller.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
//
// import '../../core/utils/app_prefs_key.dart';
//
// class NewPasswordScreen extends GetWidget<NewPasswordScreenController> {
//    NewPasswordScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConstant.backgroundColor(context),
//       body: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 20),
//                 child: SizedBox(
//                   height: kToolbarHeight,
//                   child: Row(
//                     mainAxisAlignment:
//                     MainAxisAlignment.spaceBetween,
//                     children: [
//                       Bounce(
//                         onTap: () {
//                           Get.back();
//                         },
//                         child: Container(
//                           height: getHeight(45),
//                           width: getHeight(45),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                   color: Colors.grey,
//                                   width: 1.5)),
//                           child: const Center(
//                             child: Icon(
//                               Icons.arrow_back,
//                               color: ColorConstant
//                                   .primaryBlack,
//                               size: 25,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Text("My Wishlist",style: AppStyle.style(18,fontWeight: FontWeight.w600,fontColor: ColorConstant.transparent),),
//                       Icon(Icons.add,color: Colors.transparent,)
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         Center(
//                           child: Text(
//                             "New password",
//                             style: AppStyle.style(getFontSize(24),
//                                 fontColor: ColorConstant.primaryBlack,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                         Gap(getHeight(8)),
//
//                         Gap(getHeight(60)),
//
//                         Obx(
//                               () =>
//                               CustomTextFormFiled(
//                                 text: AppString.password,
//                                 hintText: AppString.enterPassword,
//                                 onChange: (p0) {
//                                   if (p0.isEmpty) {
//                                     controller.rxList[1].value = true;
//                                   } else {
//                                     controller.rxList[1].value = false;
//                                   }
//                                 },
//                                 isObscureText: controller.isVisible.value
//                                     ? false
//                                     : true,
//                                 suffixIcons: IconButton(
//                                     highlightColor: Colors.transparent,
//                                     splashColor: Colors.transparent,
//                                     onPressed: () {
//                                       controller.iSVisibleFun();
//                                     },
//                                     icon: Icon(
//                                       controller.isVisible.value
//                                           ? CupertinoIcons.eye
//                                           : CupertinoIcons.eye_slash,
//                                       color: ColorConstant.grey9DA,
//                                     )),
//                                 isEmpty: controller.rxList[1].value,
//                                 textInputAction: TextInputAction.next,
//                                 controller: controller.passwordController,
//                               ),
//                         ),
//                         Gap(getHeight(8)),
//                         Obx(
//                               () =>
//                               CustomTextFormFiled(
//                                 text: "Confirm password",
//                                 hintText: "Enter confirm password",
//                                 onChange: (p0) {
//                                   if (p0.isEmpty) {
//                                     controller.rxListConfirm[1].value = true;
//                                   } else {
//                                     controller.rxListConfirm[1].value = false;
//                                   }
//                                 },
//                                 isObscureText: controller.isVisibleConfirm.value
//                                     ? false
//                                     : true,
//                                 suffixIcons: IconButton(
//                                     highlightColor: Colors.transparent,
//                                     splashColor: Colors.transparent,
//                                     onPressed: () {
//                                       controller.iSVisibleConfirmFun();
//                                     },
//                                     icon: Icon(
//                                       controller.isVisible.value
//                                           ? CupertinoIcons.eye
//                                           : CupertinoIcons.eye_slash,
//                                       color: ColorConstant.grey9DA,
//                                     )),
//                                 isEmpty: controller.rxListConfirm[1].value,
//                                 textInputAction: TextInputAction.next,
//                                 controller: controller.confirmPasswordController,
//                               ),
//                         ),
//                         Gap(getHeight(8)),
//                         Gap(getHeight(25)),
//                         Obx(
//                             ()=> AppElevatedButton(
//                               isLoading: AuthService.isApiLoading.value,
//                               buttonName: "Update password",
//                               onPressed: () async {
//
//                                 controller.updatePassWithValidation();
//                               }),
//                         ),
//                         Gap(getHeight(30)),
//                         Gap(getHeight(35)),
//
//                         Gap(getHeight(35)),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//
//
//             ],
//           )),
//     );
//   }
//
//   Widget _customButton({required String icon, required void Function() onTap}) {
//     return Bounce(
//       onTap: onTap,
//       child: Container(
//         height: getHeight(55),
//         width: getHeight(55),
//         decoration: BoxDecoration(
//             color: ColorConstant.primaryWhite,
//             border: Border.all(color: ColorConstant.greyD3,
//                 width: 2),
//             shape: BoxShape.circle
//         ),
//         child: Center(
//           child: SvgPicture.asset(icon, width: 30,),
//         ),
//       ),
//     );
//   }
//   final  maskFormatter = MaskTextInputFormatter(
//       mask: '+91##########',
//       filter: {"#": RegExp(r'[0-9]')},
//       type: MaskAutoCompletionType.lazy);
// }
