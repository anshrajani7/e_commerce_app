// import 'package:asisto/FirebaseServices/firebase_service.dart';
//
// import '../../../Models/product_model.dart';
// import '../../../core/app_export.dart';
// import '../../../core/utils/app_prefs_key.dart';
//
//
// class WishlistScreenController extends GetxController {
//
//   RxList category = ['All', 'Newest', 'Poplar', 'Man', 'Woman'].obs;
//   RxInt selectedIndex = 0.obs;
//   String uid = '';
//   RxList<Product> productList = <Product>[].obs;
//   RxBool isLoading = true.obs;
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     uid = CommonConstant.instance.dbHelper.box.get(HiveKey.uid)??'';
//     loadwishList();
//
//   }
//
//   Future<void> loadwishList() async {
//     print("----->${productList.length}");
//
//     productList.clear();
//      productList.value = await FirebaseService.instance.getProductInWishlist(uid: uid);
//
//     productList.refresh();
//     isLoading.value = false;
//     print("----->${productList.length}");
//   }
//
// }
