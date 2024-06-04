// import 'dart:io';
// import 'package:asisto/FirebaseServices/firebase_service.dart';
// import 'package:asisto/core/app_export.dart';
// import 'package:asisto/presentation/profile_screen/controller/profile_controller.dart';
// import 'package:asisto/widgets/bouncing_button.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flex_color_scheme/flex_color_scheme.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:gap/gap.dart';
//
// class ProfileScreen extends StatelessWidget {
//   final ProfileScreenController controller = Get.put(ProfileScreenController());
//
//   ProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var mq = MediaQuery.sizeOf(context);
//     var h = mq.height * 1;
//     var w = mq.width * 1;
//     return AnimationConfiguration.synchronized(
//       duration: Duration(milliseconds: 600),
//
//       child: SlideAnimation(
//         horizontalOffset: 100.0,
//
//         child: FadeInAnimation(
//           child: SafeArea(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: w * 0.070),
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Gap(h * 0.04),
//                     Text(
//                       AppString.profile,
//                       style: AppStyle.style(getFontSize(28),
//                           fontColor: Colors.black.withOpacity(0.8),
//                           fontWeight: FontWeight.w600),
//                     ),
//                     Gap(h * 0.04),
//                     Center(
//                       child: imageCircle(context),
//                     ),
//                     Gap(h * 0.03),
//                     customContainer(
//                         context: context,
//                         text: controller.name.value,
//                         title: AppString.name),
//                     customContainer(
//                         context: context,
//                         text: controller.phone.value,
//                         title: AppString.phoneNumber),
//                     customContainer(
//                         context: context,
//                         text: controller.gender.value,
//                         title: AppString.gender),
//                     Bounce(
//                       onTap: () async {
//                         await FirebaseAuth.instance.signOut();
//                         await FirebaseService.instance.signOutGlobally();
//                       },
//                       child: customContainer(
//                           context: context,
//                           text: "Log out",
//                           title: "Log out"),
//                     ),
//                   ]),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   Widget customContainer(
//       {required BuildContext context,
//         required String text,
//         required String title}) {
//     return Container(
//       width: double.maxFinite,
//       margin: EdgeInsets.symmetric(vertical: getHeight(8)),
//       padding: EdgeInsets.symmetric(
//           vertical: getHeight(8), horizontal: getWidth(15)),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             spreadRadius: 2.0,
//             blurRadius: 6.0,
//             offset:
//             Offset(3, 5), // Change the offset to move the shadow downwards
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: AppStyle.style(getFontSize(16),
//                 fontColor: Colors.black.withOpacity(0.8),
//                 fontWeight: FontWeight.w600),
//           ),
//           Gap(getHeight(3)),
//           Text(
//             text.toString(),
//             style: AppStyle.style(
//              getFontSize(16),
//               fontWeight: FontWeight.w500,
//               fontColor: ColorConstant.primaryBlack.withOpacity(
//                 0.6,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget imageCircle(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(5),
//       height: getHeight(100),
//       width: getHeight(100),
//       decoration: const BoxDecoration(boxShadow: [
//         BoxShadow(
//             offset: Offset(0, 5),
//             blurRadius: 10,
//             spreadRadius: 1,
//             color: ColorConstant.greyDCDC)
//       ], shape: BoxShape.circle, color: Colors.white),
//       child: controller.selectedImagePath.isNotEmpty
//           ? Obx(
//               () => Container(
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: FileImage(
//                               File(controller.selectedImagePath.value)),
//                           fit: BoxFit.cover),
//                       shape: BoxShape.circle,
//                       color: Colors.blueGrey)),
//             )
//           : CustomImageView(
//               radius: BorderRadius.circular(50),
//               fit: BoxFit.cover,
//               url: controller.image.value,
//             ),
//     );
//   }
// }
