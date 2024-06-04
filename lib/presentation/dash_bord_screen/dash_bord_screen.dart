
import 'package:flutter/cupertino.dart';

import '../../core/app_export.dart';
import 'controller/dash_bord_controller.dart';

class DashBordScreen extends GetWidget<DashBordScreenController> {
  const DashBordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor(context),
      body: WillPopScope(
          onWillPop: ()async {
            if (controller.currentIndex.value != 0) {
              controller.currentIndex.value = 0;
              return false;
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CupertinoAlertDialog(
                    title: const Text("Asisto"),
                    content: const Text("Do you want to exit the app?"),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        onPressed: () {
                          // Perform your action here if cancel is pressed
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel",
                            style: TextStyle(color: Colors.black)),
                      ),
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        onPressed: () {
                          // Perform your action here if exit is pressed

                        Get.back();
                        Get.back();
                        },
                        child:
                            const Text("Exit", style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  );
                },
              );
              return true;
            }

          },
          child: Obx(
            () => controller.page[controller.currentIndex.value],
          ),
        ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            vertical: getHeight(0), horizontal: getWidth(0)),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(1),
                  blurRadius: 16,
                  offset: const Offset(0, -1))
            ],
            color: ColorConstant.primaryWhite,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _bottomAppBarItem(
                    title: "Home",
                    icon1: ImageConstant.homeTrue,
                    page: 0,
                    icon2: ImageConstant.homeTrue,
                    context: context,
                    tag: AppString.home),
                _bottomAppBarItem(
                    title: "Category",
                    icon2: ImageConstant.shopingTrue,
                    icon1: ImageConstant.shopingTrue,
                    page: 1,
                    context: context,
                    tag: AppString.inbox),
                _bottomAppBarItem(
                    title: "Wishlist",
                    icon2: ImageConstant.heartTrue,
                    icon1: ImageConstant.heartTrue,
                    page: 2,
                    context: context,
                    tag: AppString.setting),
                _bottomAppBarItem(
                    title: "Profile",
                    icon2: ImageConstant.userTrue,
                    icon1: ImageConstant.userFalse,
                    page: 3,
                    tag: AppString.account,
                    context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomAppBarItem({
    required String icon1,
    required String icon2,
    required String title,
    required int page,
    required BuildContext context,
    required String tag,
  }) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 3000),
        curve: Curves.fastLinearToSlowEaseIn,
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: EdgeInsets.only(
          left: getWidth(15),
          right: getWidth(15),
          top: getHeight(20),
          bottom: getHeight(13),
        ),
        decoration: BoxDecoration(
            // color: controller.currentIndex.value == page
            //     ? ColorConstant.primaryWhiteContainer
            //     : Colors.transparent,
            // shape: BoxShape.circle,
            ),
        child: Bounce(
          onTap: () {
            controller.pageChange(page);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                width: 30,
                controller.currentIndex.value != page ? icon1 : icon2,
                color: controller.currentIndex.value == page
                    ? ColorConstant.primaryColor
                    : ColorConstant.primaryBlack.withOpacity(0.6),
              ),
              Text(
                title,
                style: AppStyle.style(14,
                    fontColor: controller.currentIndex.value == page
                        ? ColorConstant.primaryColor
                        : ColorConstant.primaryBlack.withOpacity(0.6)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
