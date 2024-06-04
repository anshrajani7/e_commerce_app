// import 'package:asisto/core/app_export.dart';
// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
// import '../../../ApiServices/api_service.dart';
// import '../../../FirebaseServices/firebase_service.dart';
// import '../../../Models/product_model.dart';
// import '../../../Models/product_model_genarator.dart';
//
// class SearchResultScreenController extends GetxController {
//   var data;
//
//   static final Dio dio = Dio();
//   RxList<String> productIdList = <String>[].obs;
//   Future<void> loadwishList() async {
//     print("----->${productIdList.length}");
//
//     productIdList.value = await FirebaseService.instance.getProductsIdInWishlist();
//
//     productIdList.refresh();
//   }
//   RxBool isLoading = true.obs;
//   RxString title = "".obs;
//
//   RxList<Product> productsForSearch = <Product>[].obs;
//
//   Future<void> fetchProductsForSearch({required String search, String? page, void Function()? callBack}) async {
//     isLoading.value=true;
//     productsForSearch.clear();
//     ProductService productService = ProductService(dio); // Create ProductService instance
//     try {
//       ProductResponse response = await productService.getProducts(search,page);
//       var prod = response.results ?? <Product>[];
//       productsForSearch.value = prod.where((element) => element.source=="Amazon"||element.source=="Nykaa"||element.source=="Myntra"||element.source=="Ajio"||element.source=="Nykaa Beauty").toList();
//
//       if(productsForSearch.value.length<10){
//         pageIndex.value++;
//         ProductResponse response = await productService.getProducts(search,"${pageIndex.value}");
//         var proddcts = response.results ?? <Product>[];
//         var finprod = proddcts.where((element) => element.source=="Amazon"||element.source=="Nykaa"||element.source=="Myntra"||element.source=="Ajio"||element.source=="Nykaa Beauty").toList();
//
//         print("====${finprod.length}");
//         productsForSearch.addAll(finprod);
//         productsForSearch.refresh();
//         if(productsForSearch.length<10){
//           pageIndex.value++;
//           ProductResponse response = await productService.getProducts(search,"${pageIndex.value}");
//           var proddctss = response.results ?? <Product>[];
//           var finprodd = proddctss.where((element) => element.source=="Amazon"||element.source=="Nykaa"||element.source=="Myntra"||element.source=="Ajio"||element.source=="Nykaa Beauty").toList();
//
//           print("====${finprod.length}");
//           productsForSearch.addAll(finprodd);
//           productsForSearch.refresh();
//         }
//
//
//       }
//       // Do something with the products
//     } catch (e) {
//       // Handle error
//       // print('Error :$e');
//     }finally{
//       isLoading.value=false;
//     }
//   }
//
//
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     data = Get.arguments['key'];
//     title.value = Get.arguments['title']??data.toString();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       fetchProductsForSearch(
//         search: data.toLowerCase(),
//       );
//       loadwishList();
//     });
//   }
//   RxInt pageIndex = 1.obs;
//   Future<void> pageChange() async {
//     await fetchProductsForSearch(
//         search: '${data.toLowerCase()}', page: pageIndex.value.toString());
//   }
// }
