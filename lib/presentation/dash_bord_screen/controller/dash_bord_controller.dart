import 'package:get/get.dart';
import '../../home_screen/home_screen.dart';
import '../../wishlist_screen/controller/wishlist_screen_controller.dart';
import '../../wishlist_screen/wishlist_screen.dart';

class DashBordScreenController extends GetxController {
  RxInt currentIndex = 0.obs;
RxBool isExits=false.obs;
  List page = [
    HomeScreen(),
    // AllCategoryScreen(),
    //  WishlistScreen(),
    //  ProfileScreen(),

  ];


  void pageChange(int page) {
    currentIndex.value = page;
  }
}
