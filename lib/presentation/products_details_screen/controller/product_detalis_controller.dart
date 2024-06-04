// import 'package:asisto/Models/product_model.dart';
// import 'package:asisto/core/app_export.dart';
// import 'package:asisto/presentation/dash_bord_screen/controller/dash_bord_controller.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../../ApiServices/api_service.dart';
// import '../../../FirebaseServices/firebase_service.dart';
// import '../../../core/utils/app_prefs_key.dart';
// import '../../../core/utils/network_url.dart';
//
// class ProductDetailsScreenController extends GetxController {
//   RxBool isLike = false.obs;
//   PageController pageController = PageController();
//   RxInt pageIndex = 0.obs;
//   late Product data;
//   RxDouble isHide= 1.0.obs;
//   RxList<String> productIdList = <String>[].obs;
//   DashBordScreenController dashBordScreenController = Get.put(DashBordScreenController());
//   RxBool isLoading = true.obs;
//
//   Future<void> loadwishList() async {
//     print("----->${productIdList.length}");
//
//     productIdList.value = await FirebaseService.instance.getProductsIdInWishlist();
//
//     productIdList.refresh();
//     if (productIdList.contains(data.productId.toString())) {
//       isLike.value = true;
//     }
//   }
//
//   var argument = Get.arguments;
//
//   bool hasRefresh = false;
//
//   @override
//   void onInit() {
//
//     // TODO: implement onInit
//     super.onInit();
//
//     data = argument['product'];
//     hasRefresh = argument['refresh']??false;
//
//
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//      await ApiService.fetchProductDetails(productId: "${data.productId}");
//       playAudio();
//     });
//     loadwishList();
//   }
//
//   Future<void> launchURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//   Future<void> playAudio()async{
//     final player = AudioPlayer();
//     try {
//       await player.play(UrlSource(NetworkUrl.assistance));
//     } catch (e) {
//       print('Error loading asset: $e');
//     }
//   }
// }
