

import '../../../core/app_export.dart';
import '../controller/create_account_controller.dart';

class CreateAccountScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAccountScreenController());
  }
}