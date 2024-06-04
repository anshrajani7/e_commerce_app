
import '../core/constants/constants.dart';

class StorageFileMetadataModel {
  int size;
  String formattedSize;
  String contentType;
  String extension;
  String url;
  String path;
  String referenceType;
  String referenceId;
  int createdAt;

  StorageFileMetadataModel({
    required this.size,
    required this.formattedSize,
    required this.contentType,
    required this.extension,
    required this.url,
    required this.path,
    required this.referenceType,
    required this.referenceId,
    required this.createdAt,
  });

  factory StorageFileMetadataModel.fromMap(Map<String, dynamic> data) {
    return StorageFileMetadataModel(
      size: data[Constants.size],
      formattedSize: data[Constants.formattedSize],
      contentType: data[Constants.contentType],
      extension: data[Constants.extension],
      url: data[Constants.url],
      path: data[Constants.path],
      referenceType: data[Constants.referenceType],
      referenceId: data[Constants.referenceId],
      createdAt: data[Constants.createdAt],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      Constants.size: size,
      Constants.formattedSize: formattedSize,
      Constants.contentType: contentType,
      Constants.extension: extension,
      Constants.url: url,
      Constants.path: path,
      Constants.referenceType: referenceType,
      Constants.referenceId: referenceId,
      Constants.createdAt: createdAt,
    };
  }
}
