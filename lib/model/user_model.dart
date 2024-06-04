import 'dart:typed_data';
import 'package:e_commerce_app/model/user_info_model.dart';

import '../core/constants/constants.dart';

class UserModel {
  UserModel.empty();

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.fcmToken,
    required this.emailVerified,
    required this.userInfoModel,
    required this.timezone,
    required this.createdAt,
    required this.updatedAt,
    required this.textScaleFactor,
    required this.status,
    this.imageUrl = "",

    this.imagePath = "",
    this.imageBytes,
  });

  String id = "";
  String email = "";
  String firstName = "";
  String lastName = "";
  String userName = "";
  String fcmToken = "";
  bool emailVerified = false;
  String timezone = "";
  String imageUrl = "";
  String imagePath = "";
  String status = "";
  UserInfoModel userInfoModel = UserInfoModel.empty();
  Uint8List? imageBytes;
  int createdAt = 0;
  int updatedAt = 0;
  double textScaleFactor = 1.0;

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
        id: data[Constants.id],
        email: data[Constants.email],
        firstName: data[Constants.firstName],
        lastName: data[Constants.lastName],
        userName: data[Constants.userName],
        fcmToken: data[Constants.fcmToken],
        emailVerified: data[Constants.emailVerified],
    userInfoModel: UserInfoModel.fromMap(
        Map<String, dynamic>.from(data[Constants.userInfoModel] ?? {})),
        timezone: data[Constants.timezone] ?? "",
        imageUrl: data[Constants.imageUrl] ?? "",
        imagePath: data[Constants.imagePath] ?? "",
        createdAt: data[Constants.createdAt] ?? 0,
        updatedAt: data[Constants.updatedAt] ?? 0,
        status: data[Constants.status]??"",
        textScaleFactor: data[Constants.textScaleFactor]?.toDouble() ?? 1.0,
      );

  Map<String, dynamic> toMap() => {
        Constants.id: id,
        Constants.email: email,
        Constants.firstName: firstName,
        Constants.lastName: lastName,
        Constants.userName: userName,
        Constants.fcmToken: fcmToken,
        Constants.emailVerified: emailVerified,
        Constants.timezone: timezone,
        Constants.imageUrl: imageUrl,
        Constants.imagePath: imagePath,
        Constants.createdAt: createdAt,
        Constants.updatedAt: updatedAt,
        Constants.status: status,
        Constants.textScaleFactor: textScaleFactor,
        Constants.userInfoModel: userInfoModel.toMap(),
      };
}
