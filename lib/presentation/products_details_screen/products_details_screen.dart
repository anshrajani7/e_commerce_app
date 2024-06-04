// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:asisto/ApiServices/api_service.dart';
// import 'package:asisto/FirebaseServices/firebase_service.dart';
// import 'package:asisto/core/app_export.dart';
// import 'package:asisto/presentation/products_details_screen/controller/product_detalis_controller.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:gap/gap.dart';
// import 'package:share_plus/share_plus.dart';
//
// class ProductDetailsScreen extends StatefulWidget {
//   final bool isAssiste;
//   const ProductDetailsScreen({super.key,required this.isAssiste});
//
//   @override
//   State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
// }
//
// class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
//   ProductDetailsScreenController controller =Get.put(ProductDetailsScreenController());
//   @override
//   Widget build(BuildContext context) {
//     return AnimationConfiguration.synchronized(
//       duration: const Duration(milliseconds: 600),
//       child: SlideAnimation(
//         horizontalOffset: 100,
//         child: FadeInAnimation(
//           child: Scaffold(
//             backgroundColor: ColorConstant.backgroundColor(context),
//             body: SafeArea(
//               child: Obx(
//                 () => ApiService.hasData1.isTrue
//                     ? Stack(
//                         alignment: Alignment.bottomCenter,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(
//                                 height: getHeight(430),
//                                 child: Stack(
//                                   children: [
//                                     PageView.builder(
//                                       // allowImplicitScrolling: true,
//
//                                       itemBuilder: (context, index) {
//                                         return Hero(
//                                           tag: controller.data.displayImage.toString(),
//                                           // Generate unique tag
//                                           child: CustomImageView(
//                                             url: ApiService.productDetails.value
//                                                     .imageUrls[
//                                                 controller.pageIndex.value],
//                                             radius: BorderRadius.circular(12),
//                                             fit: BoxFit.fill,
//                                           ),
//                                         );
//                                       },
//                                       onPageChanged: (value) {
//                                         controller.pageIndex.value = value;
//                                       },
//                                       controller: controller.pageController,
//                                       itemCount: ApiService.productDetails.value
//                                           .imageUrls?.length,
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 20.0, vertical: 10),
//                                       child: Column(
//                                         children: [
//                                           SizedBox(
//                                             height: 150,
//                                             child: Row(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Bounce(
//                                                   onTap: () {
//                                                     Get.back();
//                                                   },
//                                                   child: Container(
//                                                     height: getHeight(45),
//                                                     width: getHeight(45),
//                                                     decoration: BoxDecoration(
//                                                         color: Colors.white,
//                                                         shape: BoxShape.circle,
//                                                         border: Border.all(
//                                                             color: Colors.grey,
//                                                             width: 1.5)),
//                                                     child: const Center(
//                                                       child: Icon(
//                                                         Icons.arrow_back,
//                                                         color: ColorConstant
//                                                             .primaryBlack,
//                                                         size: 25,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Column(
//                                                   children: [
//                                                     Obx(
//                                                       () => Bounce(
//                                                         onTap: () async {
//                                                           controller.isLike
//                                                               .toggle();
//                                                           if (controller
//                                                               .isLike.value) {
//                                                             await FirebaseService
//                                                                 .instance
//                                                                 .addProductInWishlist(
//                                                                     productId:
//                                                                         "${controller.data.productId}",
//                                                                     product:
//                                                                         controller
//                                                                             .data);
//                                                           } else {
//                                                             FirebaseService
//                                                                 .instance
//                                                                 .removeProductInWishlist(
//                                                                     productId:
//                                                                         "${controller.data.productId}");
//                                                           }
//                                                         },
//                                                         child: Container(
//                                                           height: getHeight(45),
//                                                           width: getHeight(45),
//                                                           decoration: BoxDecoration(
//                                                               color:
//                                                                   Colors.white,
//                                                               shape: BoxShape
//                                                                   .circle,
//                                                               border: Border.all(
//                                                                   color: Colors
//                                                                       .grey,
//                                                                   width: 1.5)),
//                                                           child: Center(
//                                                             child: Icon(
//                                                               controller.isLike
//                                                                       .isFalse
//                                                                   ? Icons
//                                                                       .favorite_border_rounded
//                                                                   : Icons
//                                                                       .favorite,
//                                                               color: controller
//                                                                       .isLike
//                                                                       .isFalse
//                                                                   ? ColorConstant
//                                                                       .primaryBlack
//                                                                   : ColorConstant
//                                                                       .primaryColor,
//                                                               size: 25,
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     const Gap(10),
//                                                     Bounce(
//                                                       onTap: () async {
//                                                         // Replace with your actual product ID
//                                                         try {
//                                                           FirebaseDynamicLinks
//                                                               dynamicLinks =
//                                                               FirebaseDynamicLinks
//                                                                   .instance;
//                                                           // Generate the dynamic link with Firebase Dynamic Links API
//                                                           final DynamicLinkParameters
//                                                               parameters =
//                                                               DynamicLinkParameters(
//                                                             uriPrefix:
//                                                                 'https://asisto.com/',
//                                                                 link:  Uri.parse(
//                                                                     "https://asisto3.page.link/qbvQ/?productId=${controller.data.productId}"),
//
//                                                             androidParameters:
//                                                                 const AndroidParameters(
//                                                               packageName:
//                                                                   'com.asisto',
//                                                               minimumVersion:
//                                                                   0, // Replace with the minimum app version that can handle the deep link
//                                                             ),
//                                                             iosParameters:
//                                                                 const IOSParameters(
//                                                               bundleId:
//                                                                   'com.asisto',
//                                                               minimumVersion:
//                                                                   '0', // Replace with the minimum app version that can handle the deep link
//                                                             ),
//                                                           );
//                                                           Uri url;
//                                                           final shortDynamicLink = await dynamicLinks.buildLink(parameters);
//
//                                                           url = shortDynamicLink;
//
//                                                           // Share the dynamic link
//                                                           Share.shareUri(url);
//                                                         } catch (e) {
//                                                           print(
//                                                               'Error generating dynamic link: $e');
//                                                           // Handle error generating dynamic link
//                                                         }
//                                                       },
//                                                       child: Container(
//                                                         height: getHeight(45),
//                                                         width: getHeight(45),
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           color: Colors.white,
//                                                           shape:
//                                                               BoxShape.circle,
//                                                           border: Border.all(
//                                                             color: Colors.grey,
//                                                             width: 1.5,
//                                                           ),
//                                                         ),
//                                                         child: const Center(
//                                                           child: Icon(
//                                                             Icons
//                                                                 .share_outlined,
//                                                             color: ColorConstant
//                                                                 .primaryBlack,
//                                                             size: 25,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     )
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           const Spacer(),
//                                           Container(
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(8),
//                                               color: Colors.white,
//                                             ),
//                                             child: SizedBox(
//                                               height: getHeight(50),
//                                               child: ListView.builder(
//                                                 shrinkWrap: true,
//                                                 scrollDirection:
//                                                     Axis.horizontal,
//                                                 physics:
//                                                     const NeverScrollableScrollPhysics(),
//                                                 itemCount: ApiService
//                                                     .productDetails
//                                                     .value
//                                                     .imageUrls!=null? ApiService
//                                                             .productDetails
//                                                             .value
//                                                             .imageUrls
//                                                             .length <=
//                                                         6
//                                                     ? ApiService.productDetails
//                                                         .value.imageUrls.length
//                                                     : 6 : 0,
//                                                 itemBuilder:
//                                                     (BuildContext context,
//                                                         int index) {
//                                                   return Padding(
//                                                     padding:
//                                                         const EdgeInsets.all(4),
//                                                     child: CustomImageView(
//                                                       height: getHeight(48),
//                                                       width: getHeight(48),
//                                                       fit: BoxFit.cover,
//                                                       radius:
//                                                           BorderRadius.circular(
//                                                               8),
//                                                       url: ApiService
//                                                           .productDetails
//                                                           .value
//                                                           .imageUrls[index],
//                                                     ),
//                                                   );
//                                                 },
//                                               )
//                                             ),
//                                           )
//                                           // else
//                                           //   Padding(
//                                           //     padding: EdgeInsets.symmetric(
//                                           //         horizontal: getWidth(24)),
//                                           //     child: Container(
//                                           //       decoration: BoxDecoration(
//                                           //         borderRadius:
//                                           //             BorderRadius.circular(8),
//                                           //         color: Colors.white,
//                                           //       ),
//                                           //       padding: const EdgeInsets.only(left: 4),
//                                           //       child: Row(
//                                           //         children: List.generate(
//                                           //           ApiService.productDetails.value
//                                           //               .imageUrls!.length,
//                                           //           (index) {
//                                           //             return index == 5
//                                           //                 ? Padding(
//                                           //                     padding:
//                                           //                         const EdgeInsets.only(
//                                           //                       right: 4,
//                                           //                       top: 4,
//                                           //                       bottom: 4,
//                                           //                     ),
//                                           //                     child: SizedBox(
//                                           //                       height: getHeight(48),
//                                           //                       width: getHeight(48),
//                                           //                       child: Stack(
//                                           //                         children: [
//                                           //                           CustomImageView(
//                                           //                             height:
//                                           //                                 getHeight(48),
//                                           //                             width:
//                                           //                                 getHeight(48),
//                                           //                             fit: BoxFit.cover,
//                                           //                             radius:
//                                           //                                 BorderRadius
//                                           //                                     .circular(
//                                           //                                         8),
//                                           //                             url: ApiService
//                                           //                                 .productDetails
//                                           //                                 .value
//                                           //                                 .imageUrls![index],
//                                           //                           ),
//                                           //                           Container(
//                                           //                             decoration:
//                                           //                                 BoxDecoration(
//                                           //                               color: ColorConstant
//                                           //                                   .primaryBlack
//                                           //                                   .withOpacity(
//                                           //                                       0.4),
//                                           //                               borderRadius:
//                                           //                                   BorderRadius
//                                           //                                       .circular(
//                                           //                                           8),
//                                           //                             ),
//                                           //                             child: Center(
//                                           //                               child: Text(
//                                           //                                 "+${ApiService.productDetails.value.imageUrls!.length - 4}",
//                                           //                                 style: AppStyle
//                                           //                                     .style(
//                                           //                                   16,
//                                           //                                   fontColor:
//                                           //                                       ColorConstant
//                                           //                                           .primaryWhite,
//                                           //                                   fontWeight:
//                                           //                                       FontWeight
//                                           //                                           .w600,
//                                           //                                 ),
//                                           //                               ),
//                                           //                             ),
//                                           //                           ),
//                                           //                         ],
//                                           //                       ),
//                                           //                     ),
//                                           //                   )
//                                           //                 : Padding(
//                                           //                     padding: EdgeInsets.only(
//                                           //                         right: 4,
//                                           //                         top: 4,
//                                           //                         bottom: 4),
//                                           //                     child: CustomImageView(
//                                           //                       height: getHeight(48),
//                                           //                       width: getHeight(48),
//                                           //                       fit: BoxFit.cover,
//                                           //                       radius: BorderRadius
//                                           //                           .circular(8),
//                                           //                       url: ApiService
//                                           //                           .productDetails
//                                           //                           .value
//                                           //                           .imageUrls![index],
//                                           //                     ),
//                                           //                   );
//                                           //           },
//                                           //         ),
//                                           //       ),
//                                           //     ),
//                                           //   ),
//                                           // Gap(getHeight(20)),
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: getWidth(15)),
//                                   child: Stack(
//                                     alignment: Alignment.bottomRight,
//                                     children: [
//                                       SingleChildScrollView(
//                                         child: AnimationConfiguration.synchronized(
//                                           duration:
//                                               const Duration(milliseconds: 600),
//                                           child: SlideAnimation(
//                                             horizontalOffset: 100,
//                                             child: FadeInAnimation(
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Gap(getHeight(20)),
//                                                   Text(
//                                                     ApiService.productDetails.value
//                                                             .info ??
//                                                         '',
//                                                     style: AppStyle.style(
//                                                       14,
//                                                       fontColor: ColorConstant
//                                                           .primaryBlack
//                                                           .withOpacity(0.5),
//                                                     ),
//                                                   ),
//                                                   Gap(getHeight(20)),
//                                                   Row(
//                                                     children: [
//                                                       Text(
//                                                         controller.data.subcategory1
//                                                             .toString(),
//                                                         style: AppStyle.style(
//                                                             getFontSize(20),
//                                                             fontColor: ColorConstant
//                                                                 .primaryBlack,
//                                                             fontWeight:
//                                                                 FontWeight.w600),
//                                                       ),
//                                                       const Gap(5),
//                                                       Text(
//                                                         controller.data.subcategory2
//                                                             .toString(),
//                                                         style: AppStyle.style(
//                                                             getFontSize(20),
//                                                             fontColor: ColorConstant
//                                                                 .primaryBlack,
//                                                             fontWeight:
//                                                                 FontWeight.w600),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   const Gap(10),
//                                                   Row(
//                                                     children: [
//                                                       Text(
//                                                           "${ApiService.productDetails.value.originalPrice}",
//                                                           style: TextStyle(
//                                                               fontSize: 24,
//                                                               decoration:
//                                                                   TextDecoration
//                                                                       .lineThrough,
//                                                               fontFamily: 'Inter',
//                                                               decorationColor:
//                                                                   ColorConstant
//                                                                       .primaryBlack
//                                                                       .withOpacity(
//                                                                           0.6),
//                                                               color: ColorConstant
//                                                                   .primaryBlack
//                                                                   .withOpacity(0.6),
//                                                               fontWeight:
//                                                                   FontWeight.w400)),
//                                                       const Gap(10),
//                                                       Text(
//                                                           "\u{20B9}${ApiService.productDetails.value.sellingPrice}",
//                                                           style: AppStyle.style(24,
//                                                               fontColor:
//                                                                   ColorConstant
//                                                                       .primaryBlack,
//                                                               fontWeight:
//                                                                   FontWeight.w600,
//                                                               fontFamily: "Inter")),
//                                                     ],
//                                                   ),
//                                                   Gap(getHeight(14)),
//                                                   Text(
//                                                     "Product Details",
//                                                     style: AppStyle.style(
//                                                         getFontSize(16),
//                                                         fontColor: ColorConstant
//                                                             .primaryBlack,
//                                                         fontWeight:
//                                                             FontWeight.w600),
//                                                   ),
//                                                   Text(
//                                                     controller.data.title
//                                                         .toString(),
//                                                     style: AppStyle.style(
//                                                         getFontSize(12),
//                                                         fontColor: ColorConstant
//                                                             .primaryBlack,
//                                                         fontWeight:
//                                                             FontWeight.w400),
//                                                   ),
//                                                   const Gap(10),
//                                                   const Divider(),
//                                                   const Gap(10),
//                                                   Text(
//                                                     "Available Size",
//                                                     style: AppStyle.style(
//                                                         getFontSize(16),
//                                                         fontColor: ColorConstant
//                                                             .primaryBlack,
//                                                         fontWeight:
//                                                             FontWeight.w600),
//                                                   ),
//                                                   const Gap(4),
//                                                   SingleChildScrollView(
//                                                     scrollDirection:
//                                                         Axis.horizontal,
//                                                     child: Row(
//                                                       children: List.generate(
//                                                           ApiService
//                                                               .productDetails
//                                                               .value
//                                                               .size!
//                                                               .length, (index) {
//                                                         return Row(
//                                                           mainAxisSize:
//                                                               MainAxisSize.min,
//                                                           children: [
//                                                             Container(
//                                                               padding: EdgeInsets
//                                                                   .symmetric(
//                                                                       horizontal:
//                                                                           getWidth(
//                                                                               16),
//                                                                       vertical:
//                                                                           getWidth(
//                                                                               11)),
//                                                               decoration:
//                                                                   BoxDecoration(
//                                                                       border: Border.all(
//                                                                           width: 1,
//                                                                           color: ColorConstant
//                                                                               .primaryBlack
//                                                                               .withOpacity(
//                                                                                   0.2)),
//                                                                       // color: ColorConstant.primaryWhite,
//                                                                       borderRadius:
//                                                                           BorderRadius
//                                                                               .circular(
//                                                                                   12)),
//                                                               child: Text(
//                                                                 ApiService
//                                                                         .productDetails
//                                                                         .value
//                                                                         .size?[index] ??
//                                                                     '',
//                                                                 style: AppStyle.style(
//                                                                     14,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600,
//                                                                     fontColor:
//                                                                         ColorConstant
//                                                                             .primaryBlack),
//                                                               ),
//                                                             ),
//                                                             const Gap(12),
//                                                           ],
//                                                         );
//                                                       }),
//                                                     ),
//                                                   ),
//                                                   const Gap(10),
//                                                   Row(
//                                                     children: [
//                                                       Text(
//                                                         "Available Color : ",
//                                                         style: AppStyle.style(
//                                                             getFontSize(16),
//                                                             fontColor: ColorConstant
//                                                                 .primaryBlack,
//                                                             fontWeight:
//                                                                 FontWeight.w600),
//                                                       ),
//                                                       const Gap(4),
//                                                       Row(
//                                                         children: List.generate(
//                                                             ApiService
//                                                                     .productDetails
//                                                                     .value
//                                                                     .primaryColour
//                                                                     ?.length ??
//                                                                 0, (index) {
//                                                           return Text(
//                                                             ApiService
//                                                                         .productDetails
//                                                                         .value
//                                                                         .primaryColour?[
//                                                                     index] ??
//                                                                 '',
//                                                             style: AppStyle.style(
//                                                                 14,
//                                                                 fontWeight:
//                                                                     FontWeight.w600,
//                                                                 fontColor:
//                                                                     ColorConstant
//                                                                         .primaryBlack),
//                                                           );
//                                                         }),
//                                                       )
//                                                     ],
//                                                   ),
//                                                   Gap(getHeight(100)),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       if(widget.isAssiste)
//                                       Padding(
//                                         padding: const EdgeInsets.only(bottom: 55.0),
//                                         child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.end,
//                                           children: [
//                                             Obx(
//                                             ()=> AnimatedOpacity(
//                                                  duration: const Duration(milliseconds: 100),
//                                                 opacity: controller.isHide.value,
//                                                 child: SentMessage(
//                                                                                            message: DefaultTextStyle(
//                                                 style: const TextStyle(
//                                                   fontSize: 16.0,
//                                                   color: ColorConstant.primaryColor
//                                                 ),
//                                                 child: AnimatedTextKit(
//                                                   animatedTexts: [
//                                                     TypewriterAnimatedText('This pattern will look good on body shape.'),
//                                                   ],
//                                                   onTap: () async {
//                                                 await controller.playAudio();
//                                                   },
//                                                   onFinished: (){
//                                                     Future.delayed(const Duration(milliseconds: 500)).then((value) => controller.isHide.value=0.0);
//                                                   },
//                                                 ),
//                                                                                           ),
//                                                                                         ),
//                                               ),
//                                             ),
//                                             GestureDetector(onTap: (){
//                                               if(controller.isHide.value==0.0){
//                                                 controller.isHide.value=1.0;
//                                                 controller.playAudio();
//                                               }else{
//                                                 controller.isHide.value=0.0;
//                                               }
//                                             },child: CustomImageView(imagePath: 'assets/images/png/assistant.png',height: 80,)),
//                                           ],
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                           Container(
//                             height: 55,
//                             decoration: BoxDecoration(
//                               color: ColorConstant.primaryWhite,
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: ColorConstant.primaryBlack
//                                         .withOpacity(0.4),
//                                     offset: const Offset(0, -1))
//                               ],
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: Bounce(
//                                     onTap: () async {
//                                       controller.isLike.toggle();
//                                       if (controller.isLike.value) {
//                                         await FirebaseService.instance
//                                             .addProductInWishlist(
//                                                 productId:
//                                                     "${controller.data.productId}",
//                                                 product: controller.data);
//                                       } else {
//                                         FirebaseService.instance
//                                             .removeProductInWishlist(
//                                                 productId:
//                                                     "${controller.data.productId}");
//                                       }
//                                     },
//                                     child: Container(
//                                       decoration: const BoxDecoration(
//                                           color: ColorConstant.primaryWhite),
//                                       child: Center(
//                                         child: Text(
//                                           "Add to cart",
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                           style: AppStyle.style(18,
//                                               fontColor:
//                                                   ColorConstant.primaryColor),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Bounce(
//                                     onTap: () {
//                                       controller
//                                           .launchURL(controller.data.itemUrl!);
//                                     },
//                                     child: Container(
//                                       decoration: const BoxDecoration(
//                                           color: ColorConstant.primaryColor),
//                                       child: Center(
//                                         child: Text(
//                                           "Buy Now",
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                           style: AppStyle.style(18,
//                                               fontColor:
//                                                   ColorConstant.primaryWhite),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       )
//                     : Center(
//                         child: Lottie.asset(
//                             'assets/animation/1696505804348.json')),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// class SentMessage extends StatelessWidget {
//   final Widget message;
//   const SentMessage({
//     super.key,
//     required this.message,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final messageTextGroup = Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           width: 170,
//           padding: EdgeInsets.all(6),
//           decoration: BoxDecoration(
//             color: ColorConstant.primaryWhiteContainer,
//             border: Border.all(color: ColorConstant.primaryColor),
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(8),
//               bottomLeft: Radius.circular(8),
//               bottomRight: Radius.circular(8),
//             ),
//           ),
//           child:
//             message,
//           ),
//         CustomPaint(painter: Triangle(ColorConstant.primaryWhiteContainer)),
//       ],
//     );
//
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: <Widget>[
//         messageTextGroup,
//       ],
//     );
//   }
// }
// class Triangle extends CustomPainter {
//   final Color bgColor;
//
//
//   Triangle(this.bgColor);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()..color = bgColor;
//
//     var path = Path();
//     path.lineTo(-2, 0);
//     path.lineTo(-2, 15);
//     path.lineTo(10, 0);
//     path.close();
//
//     // Draw the filled triangle
//     canvas.drawPath(path, paint);
//
//     // Draw border only on top, right, and bottom sides
//     var borderPaint = Paint()
//       ..color = ColorConstant.primaryColor
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1;
//
//     var borderPath = Path();
//
// // Draw the left side of the triangle
//     borderPath.moveTo(0, 0); // Start at the left vertex
//     borderPath.lineTo(0, 0); // Draw the left slant side
//
// // Draw the top side of the triangle
//     borderPath.moveTo(-1, 15); // Move to the top vertex
//     borderPath.lineTo(10, 0); // Draw the top side
//
// // Draw the right side of the triangle
//     borderPath.moveTo(10, 0); // Move to the right vertex
//     borderPath.lineTo(-5, 0); // Draw the right slant side
//
// // Close the path to complete the triangle shape
//     borderPath.close();
// // Close the path to complete the triangle shape
//
//     canvas.drawPath(borderPath, borderPaint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }