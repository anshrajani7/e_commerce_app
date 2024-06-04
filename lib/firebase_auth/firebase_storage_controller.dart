
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

import '../core/constants/constants.dart';
import '../core/services/cache_storage/cache_storage.dart';
import '../core/services/firebase_storage/firebase_storage_service.dart';
import '../model/storage_file_metadata_model.dart';


class FirebaseStorageController extends GetxController {
  final FirebaseStorageService storageService = FirebaseStorageService();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final ImagePicker imagePicker = ImagePicker();

  RxList<StorageFileMetadataModel> filesList = <StorageFileMetadataModel>[].obs;
  RxBool isLoading = true.obs;
  RxBool isLoadingMore = false.obs;

  RxString selectedSortBy = "".obs;
  Future<void> captureAndCropImage() async {
    // Capture image from camera
    final XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // Crop the captured image
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedImage.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9,
        ],
      );

      // Do something with the cropped image (e.g., upload to Firebase Storage)
      if (croppedFile != null) {
        // Upload the cropped image to Firebase Storage or perform any other operation
      }
    }
  }

  List<String> sortByList = [
    Constants.dateDesc,
    Constants.dateAsc,
    Constants.sizeDesc,
    Constants.sizeAsc,
  ];

  int batchSize = 12;
  DocumentSnapshot? startAfterDoc;
  RxBool noMoreFiles = false.obs;

  List<String> imageExtensions = ['jpg', 'jpeg', 'png'];

  String formatBytes(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      double kb = bytes / 1024;
      return '${kb.toStringAsFixed(2)} KB';
    } else if (bytes < 1024 * 1024 * 1024) {
      double mb = bytes / (1024 * 1024);
      return '${mb.toStringAsFixed(2)} MB';
    } else {
      double gb = bytes / (1024 * 1024 * 1024);
      return '${gb.toStringAsFixed(2)} GB';
    }
  }


  Future<Uint8List?> getImage({
    required ImageSource imageSource,
    required bool isFile,
  }) async {
    Uint8List? imageBytes;

      var selectedImage = await imagePicker.pickImage(source: imageSource);
      if (selectedImage != null) {
        final croppedFile = await ImageCropper().cropImage(
          sourcePath: selectedImage.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9,
          ],
        );
        imageBytes = await croppedFile?.readAsBytes();
    }
    if (imageBytes != null && imageBytes.isNotEmpty) {
      img.Image image = img.decodeImage(imageBytes)!;
      img.Image compressed = img.copyResize(
        image,
        width: image.width > 1000 ? 1000 : image.width,
      );
      Uint8List resizedImageBytes = img.encodeJpg(compressed);
      imageBytes = await FlutterImageCompress.compressWithList(
        resizedImageBytes,
        quality: 30,
      );
    }
    return imageBytes;
  }
  @pragma('vm:entry-point')
  Future<Uint8List> compressImage(
    Uint8List imageBytes,
  ) async {
    int length = imageBytes.length;
    debugPrint("length... $length");
    debugPrint(formatBytes(length));
    // Decode image
    img.Image image = img.decodeImage(imageBytes)!;
    // Compress image
    img.Image compressed = img.copyResize(
      image,
      width: image.width > 1000 ? 1000 : image.width,
    );
    Uint8List resizedImageBytes = img.encodeJpg(compressed);
    length = resizedImageBytes.length;
    debugPrint("length... $length");
    debugPrint(formatBytes(length));

    return imageBytes;
  }

  createMetadataDoc({required StorageFileMetadataModel metadata}) async {
    String userId = CacheStorageService.instance.read(Constants.userId) ?? "";
    await firestore
        .collection(Constants.usersCollection)
        .doc(userId)
        .collection(Constants.firebaseStorageMetadataCollection)
        .doc(userId)
        .set(metadata.toMap());
  }

  deleteMetadataDoc({required String path}) async {
    String userId = CacheStorageService.instance.read(Constants.userId);
    var query = await firestore
        .collection(Constants.usersCollection)
        .doc(userId)
        .collection(Constants.firebaseStorageMetadataCollection)
        .where(Constants.path, isEqualTo: path)
        .get();
    if (query.docs.isNotEmpty) {
      query.docs.first.reference.delete();
    }
  }


}
