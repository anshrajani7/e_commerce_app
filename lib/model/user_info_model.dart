

import '../core/constants/constants.dart';

class UserInfoModel {
  String birthDate = "Jan 01, 1981";
  String gender = "Male";
  String country = "United States";
  String language = 'English';
  UserInfoModel.empty();

  UserInfoModel({
    required this.birthDate,
    required this.gender,
    required this.country,
    required this.language,
  });

  factory UserInfoModel.fromMap(Map<String, dynamic> data) => UserInfoModel(
    birthDate: data[Constants.birthDate],
    gender: data[Constants.gender],
    country: data[Constants.country],
    language: data[Constants.language],
  );

  Map<String, dynamic> toMap() => {
    Constants.birthDate: birthDate,
    Constants.gender: gender,
    Constants.country: country,
    Constants.language: language,
  };
}
