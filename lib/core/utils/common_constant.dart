import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../widgets/custom_elevated_button.dart';
import '../app_export.dart';

class CommonConstant {
  CommonConstant._();

  static final instance = CommonConstant._();

  String emailPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  Pattern phonePattern = r'(^[0-9 ]*$)';

  bool validateEmail(String email) {
    return RegExp(emailPattern).hasMatch(email);
  }

  String getFileExtension(String fileName) {
    return fileName.split('.').last;
  }

  String checkDeviceType() {
    if (kIsWeb) {
      return "Web";
    } else if (Platform.isIOS) {
      return "Ios";
    } else {
      return "Android";
    }
  }

  Future<String?> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      if (kDebugMode) {
        print('Running on ${androidInfo.id}');
      } //
      return androidInfo.id;
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      if (kDebugMode) {
        print('Running on ${iosInfo.identifierForVendor}');
      }
      return iosInfo.identifierForVendor;
    }
  }

  Future<bool> requestFilePermission() async {
    late AndroidDeviceInfo androidInfo;
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      try {
        androidInfo = await deviceInfo.androidInfo;
        print(androidInfo.version.sdkInt);
      } catch (e) {
        print('Failed to get Android device info: $e');
      }
    }
    PermissionStatus result;
    PermissionStatus resultAudio;
    if (Platform.isAndroid) {
      if (androidInfo.version.sdkInt >= 33) {
        result = await Permission.photos.request();
        resultAudio = await Permission.audio.request();
      } else {
        result = await Permission.storage.request();
        resultAudio = await Permission.audio.request();
      }
      if (androidInfo.version.sdkInt >= 33) {
        if (result.isGranted && resultAudio.isGranted) {
          return true;
        }
      } else {
        if (result.isGranted) {
          return true;
        }
      }
    } else {
      result = await Permission.photos.request();
      if (result.isGranted) {
        return true;
      }
    }
    return false;
  }

  Future<bool> requestLocationPermission() async {
    const permission = Permission.location;

    if (await permission.isDenied) {
      await permission.request();
    }
    if (await permission.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  void commonShowDialogs({
    required Widget child,
    required BuildContext context,
    String? firstButtonTitle,
    double? radius,
    Color? backgroundColor,
    void Function()? firstOnPressed,
    String? secondButtonTitle,
    void Function()? secondOnPressed,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
            contentPadding: EdgeInsets.zero,
            backgroundColor:
                backgroundColor ?? ColorConstant.containerBackGround(context),
            surfaceTintColor:
                backgroundColor ?? ColorConstant.containerBackGround(context),
            content: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius ?? 20),
                color: backgroundColor ??
                    ColorConstant.containerBackGround(context),
              ),
              padding: EdgeInsets.symmetric(
                  vertical: getHeight(30), horizontal: getWidth(22)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  child,
                  SizedBox(
                    height: getHeight(10),
                  ),
                  firstButtonTitle != null
                      ? AppElevatedButton(
                          buttonName: firstButtonTitle,
                          onPressed: firstOnPressed ?? () {})
                      : const SizedBox.shrink(),
                  secondButtonTitle != null
                      ? SizedBox(
                          height: getHeight(11),
                        )
                      : const SizedBox.shrink(),
                  secondButtonTitle != null
                      ? AppElevatedButton(
                          hasGradient: false,
                          textColor: ColorConstant.textBlackToGreen(context),
                          buttonColor:
                              ColorConstant.containerBackGround(context),
                          buttonName: secondButtonTitle,
                          onPressed: secondOnPressed ?? () {})
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          );
        });
  }
}
