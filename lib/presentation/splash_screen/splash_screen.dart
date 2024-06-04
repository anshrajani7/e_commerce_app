
import '../../core/app_export.dart';
import 'controller/splash_screen_controller.dart';

class SplashScreen extends GetWidget<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor(context),
        body: Center(
          child: Image.asset(
            width: getWidth(200),
            ImageConstant.appLogo,
          ),
        ));
  }
}
