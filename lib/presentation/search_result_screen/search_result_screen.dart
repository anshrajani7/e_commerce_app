// import 'package:asisto/core/app_export.dart';
// import 'package:asisto/presentation/home_screen/controller/home_screen_controller.dart';
// import 'package:asisto/presentation/products_details_screen/products_details_screen.dart';
// import 'package:asisto/presentation/search_result_screen/controller/search_result_controller.dart';
// import 'package:asisto/widgets/bouncing_button.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:gap/gap.dart';
//
// import '../../ApiServices/api_service.dart';
// import '../../FirebaseServices/firebase_service.dart';
// import '../../widgets/custom_shimmer_gried_view.dart';
//
// class SearchResultScreen extends StatefulWidget {
//   final bool isAssiste;
//   SearchResultScreen({super.key,required this.isAssiste});
//
//   @override
//   State<SearchResultScreen> createState() => _SearchResultScreenState();
// }
//
// class _SearchResultScreenState extends State<SearchResultScreen> {
//   SearchResultScreenController controller = Get.put(SearchResultScreenController());
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       backgroundColor: ColorConstant.backgroundColor(context),
//       appBar: CommonAppbar(
//         onTap: () {
//           Get.back();
//         },
//         title: controller.title.value,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: getWidth(15), vertical: getHeight(20)),
//           child: Column(
//             children: [
//               Obx(() => !controller.isLoading.value
//                   ? Column(
//                       children: [
//                         AnimationLimiter(
//                           child: GridView.builder(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             gridDelegate:
//                                 SliverGridDelegateWithFixedCrossAxisCount(
//                               mainAxisExtent: getHeight(270),
//                               crossAxisCount: 2, // Number of columns
//                               crossAxisSpacing: 15, // Spacing between columns
//                               mainAxisSpacing: 15, // Spacing between rows
//                             ),
//                             itemCount: controller.productsForSearch.length,
//                             itemBuilder: (BuildContext context, int index) {
//                               controller.loadwishList();
//                               var list = controller.productsForSearch[index];
//                               RxList isLike = RxList<RxBool>.generate(
//                                   ApiService.products.length,
//                                       (index) => false.obs);
//                               if (controller.productIdList.contains(list.productId.toString())) {
//                                 isLike[index].value = true;
//                               }
//                               return AnimationConfiguration.staggeredGrid(
//                                 columnCount: 2,
//                                 position: index,
//                                 duration: const Duration(milliseconds: 800),
//                                 child: SlideAnimation(
//                                   horizontalOffset: 100.0,
//                                   child: FadeInAnimation(
//
//                                     child: Bounce(
//                                       onTap: () {
//                                         Get.to(
//                                             ProductDetailsScreen(isAssiste: widget.isAssiste),
//                                             arguments: {
//                                               "product": list
//                                             });
//                                       },
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                             color: ColorConstant
//                                                 .primaryWhite,
//                                             boxShadow: [
//                                               BoxShadow(
//                                                   color: Colors.grey
//                                                       .withOpacity(0.2),
//                                                   spreadRadius: 2,
//                                                   blurRadius: 20)
//                                             ],
//                                             borderRadius:
//                                             BorderRadius.circular(
//                                                 13),
//                                             border: Border.all(
//                                                 color: Colors.black
//                                                     .withOpacity(0.2),
//                                                 width: 1.5)),
//                                         child: Column(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                           crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                           children: [
//                                             Stack(
//                                               alignment:
//                                               Alignment.bottomRight,
//                                               children: [
//                                                 Container(
//                                                   decoration:
//                                                   const BoxDecoration(
//                                                       boxShadow: [
//                                                         BoxShadow(
//                                                             color: ColorConstant
//                                                                 .greyD3,
//                                                             spreadRadius:
//                                                             2,
//                                                             blurRadius:
//                                                             10)
//                                                       ]),
//                                                   width:
//                                                   double.infinity,
//                                                   height:
//                                                   getHeight(195),
//                                                   child: Hero(
//                                                     placeholderBuilder:
//                                                         (context,
//                                                         heroSize,
//                                                         child) {
//                                                       return CustomImageView(
//                                                         fit:
//                                                         BoxFit.fill,
//                                                         radius: const BorderRadius
//                                                             .only(
//                                                             topRight: Radius
//                                                                 .circular(
//                                                                 12),
//                                                             topLeft: Radius
//                                                                 .circular(
//                                                                 12)),
//                                                         url: list
//                                                             .displayImage
//                                                             .toString(),
//                                                       );
//                                                     },
//                                                     tag: list
//                                                         .displayImage
//                                                         .toString(),
//                                                     // Generate unique tag
//                                                     child:
//                                                     CustomImageView(
//                                                       fit: BoxFit.fill,
//                                                       radius: const BorderRadius
//                                                           .only(
//                                                           topRight: Radius
//                                                               .circular(
//                                                               12),
//                                                           topLeft: Radius
//                                                               .circular(
//                                                               12)),
//                                                       url: list
//                                                           .displayImage
//                                                           .toString(),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Padding(
//                                                   padding:
//                                                   const EdgeInsets
//                                                       .all(8.0),
//                                                   child: Obx(
//                                                         () => Bounce(
//                                                       onTap: () async {
//                                                         isLike[index]
//                                                             .value =
//                                                         !isLike[index]
//                                                             .value;
//                                                         if (isLike[
//                                                         index]
//                                                             .value) {
//                                                           await FirebaseService
//                                                               .instance
//                                                               .addProductInWishlist(
//                                                               productId:
//                                                               "${list.productId}",
//                                                               product:
//                                                               list);
//                                                         } else {
//                                                           FirebaseService
//                                                               .instance
//                                                               .removeProductInWishlist(
//                                                               productId:
//                                                               "${list.productId}");
//                                                         }
//                                                       },
//                                                       child: Container(
//                                                         height:
//                                                         getHeight(
//                                                             40),
//                                                         width:
//                                                         getHeight(
//                                                             40),
//                                                         decoration:
//                                                         BoxDecoration(
//                                                           color: Colors
//                                                               .white
//                                                               .withOpacity(
//                                                               0.7),
//                                                           shape: BoxShape
//                                                               .circle,
//                                                         ),
//                                                         child: Center(
//                                                           child: Icon(
//                                                             !isLike[index]
//                                                                 .value
//                                                                 ? Icons
//                                                                 .favorite_border_rounded
//                                                                 : Icons
//                                                                 .favorite,
//                                                             color: !isLike[
//                                                             index]
//                                                                 .value
//                                                                 ? ColorConstant
//                                                                 .primaryBlack
//                                                                 : ColorConstant
//                                                                 .primaryColor,
//                                                             size: 25,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Padding(
//                                               padding:
//                                               const EdgeInsets.all(
//                                                   5.0),
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                 CrossAxisAlignment
//                                                     .start,
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment
//                                                     .spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                     "\u{20B9}${list.sellingPrice}",
//                                                     style: AppStyle.style(
//                                                         getFontSize(14),
//                                                         fontWeight:
//                                                         FontWeight
//                                                             .w600),
//                                                   ),
//                                                   Text(
//                                                     "${list.source}",
//                                                     softWrap: true,
//                                                     overflow:
//                                                     TextOverflow
//                                                         .ellipsis,
//                                                     style: AppStyle.style(
//                                                         fontColor:
//                                                         ColorConstant
//                                                             .primaryColor,
//                                                         getFontSize(13),
//                                                         fontWeight:
//                                                         FontWeight
//                                                             .w500),
//                                                   ),
//                                                   Text(
//                                                     "${list.title}",
//                                                     maxLines: 1,
//                                                     softWrap: true,
//                                                     overflow:
//                                                     TextOverflow
//                                                         .ellipsis,
//                                                     style: AppStyle.style(
//                                                         getFontSize(11),
//                                                         fontWeight:
//                                                         FontWeight
//                                                             .w500),
//                                                   ),
//                                                 ],
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         Gap(getHeight(25)),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Bounce(
//                               onTap:() async {
//                                if( controller.pageIndex.value>=2){
//                                  controller.pageIndex.value--;
//                                 await controller.pageChange();
//                                }
//                               },
//                               child: Container(
//                                 height: 45,
//                                 width: 100,
//                                 decoration: BoxDecoration(
//                                     border: Border.all(
//                                         width: 1.5,
//                                         color: ColorConstant.primaryColor),
//                                     borderRadius: BorderRadius.circular(8)),
//                                 child: Center(
//                                   child: Text(
//                                     "Previous",
//                                     textAlign: TextAlign.center,
//                                     style: AppStyle.style(16,
//                                         fontColor: ColorConstant.primaryColor,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: const BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: ColorConstant.primaryColor),
//                                 child: Center(
//                                   child: Text(
//                                     controller.pageIndex.value.toString(),
//                                     style: AppStyle.style(16,
//                                         fontWeight: FontWeight.w500,
//                                         fontColor: ColorConstant.primaryWhite),
//                                   ),
//                                 )),
//                             Bounce(
//                               onTap: () async {
//                                 controller.pageIndex.value++;
//                                 await controller.pageChange();
//                               },
//                               child: Container(
//                                 height: 45,
//                                 width: 100,
//                                 decoration: BoxDecoration(
//                                     color: ColorConstant.primaryColor,
//                                     border: Border.all(
//                                         width: 1.5,
//                                         color: ColorConstant.primaryColor),
//                                     borderRadius: BorderRadius.circular(8)),
//                                 child: Center(
//                                   child: Text(
//                                     "Next page",
//                                     style: AppStyle.style(16,
//                                         fontColor: ColorConstant.primaryWhite,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     )
//                   : Column(
//                       children: shimmeringList,
//                     )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   final List<Widget> shimmeringList = List.generate(6, (index) {
//     return YourShimmeringListView(
//       key: Key('shimmering_list_$index'),
//     );
//   });
// }
