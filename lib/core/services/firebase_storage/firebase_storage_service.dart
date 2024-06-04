import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';

import '../../../model/storage_upload_metadata_model.dart';


class FirebaseStorageService {
  static FirebaseStorageService? _instance;
  FirebaseStorage _storage = FirebaseStorage.instance;
  factory FirebaseStorageService() {
    _instance ??= FirebaseStorageService._internal();
    return _instance!;
  }

  FirebaseStorageService._internal();
  Future<StorageUploadMetadataModel> putData({
    required Uint8List bytes,
    required String path,
    required String contentType,
  }) async {
    Reference ref = _storage.ref(path);
    debugPrint(ref.bucket);
    await ref.putData(
      bytes,
      SettableMetadata(contentType: contentType),
    );
    String url = await ref.getDownloadURL();
    return StorageUploadMetadataModel(
      path: ref.fullPath,
      url: url,
    );
  }

  deleteFile(String path) async {
    Reference ref = _storage.ref(path);
    await ref.delete();
  }

  useDefaultBucket() {
    _storage = FirebaseStorage.instance;
  }

  useUSBucket() {
    _storage = FirebaseStorage.instanceFor(bucket: "bucket-name");
  }

  Future<int> getFolderSize(String folderPath) async {
    int totalSize = 0;
    Reference folderRef = _storage.ref(folderPath);
    ListResult result = await folderRef.listAll();

    for (var item in result.items) {
      final metadata = await item.getMetadata();
      totalSize += metadata.size ?? 0;
      debugPrint("totalSize$totalSize");
    }

    for (var prefix in result.prefixes) {
      totalSize += await getFolderSize(prefix.fullPath);
    }

    return totalSize;
  }

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
}
