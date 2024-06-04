// import 'package:asisto/ApiServices/api_service.dart';
// import 'package:asisto/presentation/dash_bord_screen/controller/dash_bord_controller.dart';
// import 'package:asisto/presentation/products_details_screen/products_details_screen.dart';
// import 'package:asisto/presentation/wishlist_screen/controller/wishlist_screen_controller.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:shimmer/shimmer.dart';
//
// import '../../core/app_export.dart';
//
// class WishlistScreen extends StatelessWidget {
//
//   const WishlistScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final WishlistScreenController controller = Get.put(WishlistScreenController());
//     final DashBordScreenController dashBordScreenController = Get.put(DashBordScreenController());
//
//     sizeCalculate(context);
//     return SafeArea(
//       child: SizedBox(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Column(
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
//                           dashBordScreenController.pageChange(0);
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
//                       Text("My Wishlist",style: AppStyle.style(18,fontWeight: FontWeight.w600,fontColor: ColorConstant.primaryBlack),),
//                       Icon(Icons.add,color: Colors.transparent,)
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: getHeight(24),),
//               Expanded(child: Padding(
//                 padding:  EdgeInsets.symmetric(horizontal: getWidth(16)),
//                 child: Obx(
//                   ()=>
//                   controller.isLoading.value?GridView.builder(
//                     itemCount: 10,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//
//                       crossAxisCount: 2,
//                       crossAxisSpacing: getWidth(16),
//                       mainAxisExtent: getHeight(250)),
//                       itemBuilder: (context, index) {
//                         return Shimmer.fromColors(
//                           baseColor: Colors.grey[300]!,
//                           highlightColor: Colors.grey[100]!,
//
//                           child: Column(
//                             // mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Card(
//                                 child: SizedBox(
//                                   height: 160,
//                                   width: 160,
//                                 ),
//                               ),
//                               // Adjust spacing between rows
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Expanded(
//                                     flex:3,
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(2),
//                                       ),
//                                       child: Card(
//                                         child: SizedBox(
//                                           height: 20,
//                                           width: 160 ,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   // Adjust spacing between shimmer containers
//
//                                   Expanded(
//                                     flex:1,
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(2),
//                                       ),
//                                       child: Card(
//                                         child: SizedBox(
//                                           height: 20,
//                                           width: 160 * 0.2,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(2),
//                                 ),
//                                 child: Card(
//                                   child: SizedBox(
//                                     height: 20,
//                                     width: 160 * 0.4,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         );
//                       },):controller.productList.isEmpty?Padding(
//                         padding: const EdgeInsets.only(top: 240.0),
//                         child: Text("No data availble!"),
//                       ):AnimationLimiter(
//                         child: GridView.builder(
//                                             itemCount: controller.productList.length,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             crossAxisSpacing: getWidth(16),
//                             mainAxisExtent: getHeight(250)), itemBuilder: (context, index) {
//                           return AnimationConfiguration.staggeredGrid(
//                             columnCount: 2,
//                             position: index,
//                             duration: const Duration(milliseconds: 800),
//                             child: SlideAnimation(
//                               horizontalOffset: 100.0,
//                               child: FadeInAnimation(
//
//                                 child: Bounce(
//                                   onTap: () {
//                                     Get.to(
//                                         ()=>const ProductDetailsScreen(isAssiste: false),
//                                         arguments: {"product":controller.productList[index],"refresh":true})?.then((value) {
//                                        controller.loadwishList();
//                                     });
//                                   },
//                                   child: Column(
//                                     children: [
//                                       CustomImageView(
//                                         height: 160,
//                                         radius: BorderRadius.circular(12),
//                                         width: 160,
//                                         fit: BoxFit.cover,
//
//                                         url: controller.productList[index].displayImage,),
//                                       SizedBox(height: getHeight(12),),
//                                       Row(children: [
//                                         Text("${controller.productList[index].subcategory3}",style: AppStyle.style(14,
//                                             fontWeight: FontWeight.w500,
//
//                                             fontColor: ColorConstant.primaryBlack),),
//                                         Spacer(),
//                                         Icon(Icons.star_rounded,color: Colors.amber,),
//                                         Text("${controller.productList[index].duplicateRankCount}",style: AppStyle.style(12,fontColor: ColorConstant.primaryBlack.withOpacity(0.4)),)
//                                       ],),
//                                       SizedBox(height: getHeight(8),),
//                                       Row(
//                                         children: [
//                                           Text("\₹${controller.productList[index].sellingPrice}",style: AppStyle.style(18,fontColor: ColorConstant.primaryBlack,fontWeight: FontWeight.w600),),
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },),
//                       ),
//                 ),
//               ))
//
//             ],
//           ),
//
//       ),
//     );
//   }
// }
