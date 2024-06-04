import '../core/app_export.dart';

class CustomSnackBar {
  static void showSnackBar({headerText, bodyText}) {
    Get.closeAllSnackbars();
    Get.snackbar(headerText, bodyText,
        snackPosition: SnackPosition.TOP,
        colorText: ColorConstant.primaryColor,
        backgroundColor: ColorConstant.primaryColor.withOpacity(0.15),
        margin: const EdgeInsets.only(bottom: 26, left: 16, right: 16));
  }
}
