

import '../../../core/app_export.dart';
import '../controller/forgot_password_screen_controller.dart';

class ForgotPasswordScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordScreenController());
  }
}
