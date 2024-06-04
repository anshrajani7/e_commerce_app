//
//
// import 'package:asisto/core/app_export.dart';
// import 'package:asisto/core/utils/app_prefs_key.dart';
// import 'package:asisto/widgets/custome_image_select.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ProfileScreenController extends GetxController {
//   RxString name=''.obs;
//   RxString phone=''.obs;
//   RxString gender=''.obs;
//   RxString image=''.obs;
//   RxString selectedImagePath = "".obs;
// @override
//   onInit(){
//   super.onInit();
//   name.value = CommonConstant.instance.dbHelper.box.get(HiveKey.name)??"";
//   phone.value = CommonConstant.instance.dbHelper.box.get(HiveKey.phone)??'';
//   gender.value = CommonConstant.instance.dbHelper.box.get(HiveKey.gender)??'';
//   image.value = CommonConstant.instance.dbHelper.box.get(HiveKey.image)??'';
// }
//   Future<void> pickImageGallery() async {
//     //
//     final pickedFile = await CustomGalleryDialog.instance
//         .selectImageFromSystem(ImageSource.gallery);
//
//     if (pickedFile != null) {
//       selectedImagePath.value = pickedFile.path;
//       Get.back();
//     } else {
//       if (kDebugMode) {
//         print('No image selected.');
//       }
//     }
//   }
//
//   Future<void> pickImageCamera() async {
//     //
//     final pickedFile = await CustomGalleryDialog.instance
//         .selectImageFromSystem(ImageSource.camera);
//
//     if (pickedFile != null) {
//       selectedImagePath.value = pickedFile.path;
//       Get.back();
//     } else {
//       if (kDebugMode) {
//         print('No image selected.');
//       }
//     }
//   }
// }
