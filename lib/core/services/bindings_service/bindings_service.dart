import 'package:e_commerce_app/firebase_auth/firebase_auth_services.dart';
import 'package:get/get.dart';

class BindingsService extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthServices(), permanent: true);
  }
}
