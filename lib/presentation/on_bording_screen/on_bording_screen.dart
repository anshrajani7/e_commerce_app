// import 'package:asisto/core/app_export.dart';
// import 'package:asisto/presentation/on_bording_screen/controller/on_bording_controller.dart';
//
// class OnBordingScreen extends GetWidget<OnBordingScreenController> {
//   const OnBordingScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConstant.primaryWhite.withOpacity(0.95),
//       body: Column(
//         children: [
//           Stack(
//             children: [
//               SizedBox(
//                 height: getHeight(620),
//                 child: PageView.builder(
//                   // allowImplicitScrolling: true,
//
//                   itemBuilder: (context, index) {
//                     return CustomImageView(
//                       imagePath: controller.image[index],
//                       radius: BorderRadius.circular(12),
//                       fit: BoxFit.fill,
//                     );
//                   },
//                   onPageChanged: (value) {
//                     controller.index.value = value;
//                   },
//                   controller: controller.pageController,
//                   itemCount: 3,
//                 ),
//               ),
//               Padding(
//                 padding:  EdgeInsets.symmetric(horizontal: 18.0,vertical: 40),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Bounce(
//                       onTap: () {
//                         controller.index.value = 2;
//                         controller.pageController.jumpToPage(controller.index.value);
//                       },
//                       child: Text(
//                         AppString.skip,
//                         style: AppStyle.style(getFontSize(14),
//                             fontColor: ColorConstant.primaryColor),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//       bottomSheet: Container(
//         height: getHeight(280),
//         width: double.maxFinite,
//         decoration: const BoxDecoration(
//             color: ColorConstant.primaryWhite,
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(30), topLeft: Radius.circular(30))),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             RichText(
//                 textAlign: TextAlign.center,
//                 textScaler: const TextScaler.linear(1.0),
//                 text: TextSpan(
//                   text: AppString.wishList,
//                   style: AppStyle.style(getFontSize(22),
//                       fontColor: ColorConstant.primaryBlack,
//                       fontWeight: FontWeight.w700),
//                   children: <TextSpan>[
//                     TextSpan(
//                       text: AppString.fashionDreams,
//                       style: AppStyle.style(
//                         getFontSize(22),
//                         fontWeight: FontWeight.w700,
//                         fontColor: ColorConstant.primaryColor,
//                       ),
//                     ),
//                     TextSpan(
//                       text: AppString.begin,
//                       style: AppStyle.style(
//                         getFontSize(22),
//                         fontWeight: FontWeight.w700,
//                         fontColor: ColorConstant.primaryBlack,
//                       ),
//                     ),
//                   ],
//                 )),
//             Text(
//               AppString.lorem34,
//               textAlign: TextAlign.center,
//               style: AppStyle.style(getFontSize(12)),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Bounce(
//                   onTap: () {
//                     if (controller.index.value > 0) {
//                       controller.index.value--;
//                       controller.pageController.jumpToPage(controller.index.value);
//                     }
//                   },
//                   child: Container(
//                     height: getHeight(55),
//                     width: getHeight(55),
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                             color: ColorConstant.primaryColor, width: 2)),
//                     child: const Center(
//                       child: Icon(
//                         Icons.arrow_back,
//                         color: ColorConstant.primaryColor,
//                         size: 25,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: getWidth(50),
//                   child: Obx(
//                     () => Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         _customRoundSlider(
//                             index: 0, selecteIndex: controller.index.value),
//                         _customRoundSlider(
//                             index: 1, selecteIndex: controller.index.value),
//                         _customRoundSlider(
//                             index: 2, selecteIndex: controller.index.value),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Bounce(
//                   onTap: () {
//                     controller.index.value++;
//                     controller.pageController.jumpToPage(controller.index.value);
//                     if (controller.index.value == 3) {
//                       Get.toNamed(AppRoutes.createAccountScreenRoute);
//                       controller.index.value--;
//                     }
//                   },
//                   child: Container(
//                     height: getHeight(55),
//                     width: getHeight(55),
//                     decoration: BoxDecoration(
//                         color: ColorConstant.primaryColor,
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                             color: ColorConstant.primaryColor, width: 2)),
//                     child: const Center(
//                       child: Icon(
//                         Icons.arrow_forward_rounded,
//                         color: ColorConstant.primaryWhite,
//                         size: 25,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _customRoundSlider({required int index, required int selecteIndex}) {
//     return Container(
//       height: index == selecteIndex ? 13 : 10,
//       width: index == selecteIndex ? 13 : 10,
//       decoration: BoxDecoration(
//           color: index == selecteIndex
//               ? ColorConstant.primaryColor
//               : ColorConstant.grey9DA,
//           shape: BoxShape.circle),
//     );
//   }
// }
