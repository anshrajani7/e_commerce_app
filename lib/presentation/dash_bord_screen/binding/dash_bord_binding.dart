

import '../../../core/app_export.dart';
import '../controller/dash_bord_controller.dart';

class DashBordScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashBordScreenController());
  }
}
