 import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../core/app_export.dart';
import '../core/services/cache_storage/cache_storage.dart';
import '../model/storage_file_metadata_model.dart';
import '../model/storage_upload_metadata_model.dart';
import '../model/user_info_model.dart';
import '../model/user_model.dart';
import 'firebase_storage_controller.dart';

class AuthServices extends GetxController{
  static const secureStorage = FlutterSecureStorage();
  var nameController = TextEditingController().obs;
  var lastNameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var userNameController = TextEditingController().obs;
  var phoneNumberController = TextEditingController().obs;
  var phoneOTPController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var confirmPasswordController = TextEditingController().obs;
  var forgotPasswordController = TextEditingController().obs;
  var emailControllerLogin = TextEditingController().obs;
  var passwordControllerLogin = TextEditingController().obs;

  Rx<UserModel> userModel = UserModel.empty().obs;
  RxBool isShowPassLogin = false.obs;
  RxBool isShowPass = false.obs;
  RxBool isShowConfirmPass = false.obs;
  RxBool isDataAvailable = false.obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseStorageController firebaseStorageController =
  Get.put(FirebaseStorageController(), permanent: true);
  //final googleSignIn = GoogleSignIn();
  //GoogleSignInAccount? user;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String phoneOTPVerificationId = "";
  int phoneOTPResendToken = 0;

  Rx<UserModel> newUserModel = UserModel.empty().obs;

  // Map<String, String> timezonesMap = customTimezonesMap;

  final GlobalKey<FormState> accountFormKey = GlobalKey<FormState>();

  // create a function that refresh firebase auth token when expired
  Future<void> refreshToken() async {
   await reloadUserData();
   if (userModel.value.id.isNotEmpty && !userModel.value.emailVerified) {
    Timer.periodic(const Duration(minutes: 1), (_) async {
     await reloadUserData();
    });
   }
  }


  reloadUserData() async {
   String userId = CacheStorageService.instance.read(Constants.userId) ?? "";
   var user = _auth.currentUser;
   user = _auth.currentUser;
   debugPrint("#ReloadUserData # User ID ${user?.uid}");
   if (user != null && userId.isNotEmpty) {
    await getUser();
    await user.reload();
    try {
     if (user.emailVerified && !userModel.value.emailVerified) {
      userModel.value.emailVerified = true;
      newUserModel.value.emailVerified = true;
      newUserModel.refresh();
      updateUser();
     }
    } catch (error) {
     debugPrint("error... ${error.toString()}");
     logoutUser(forceLogout: true);
    }
   }
  }


  cacheUserData() async {
   String userName =
       "${userModel.value.firstName} ${userModel.value.lastName}";
   await CacheStorageService.instance
       .write(Constants.userId, userModel.value.id);
   await CacheStorageService.instance
       .write(Constants.userEmail, userModel.value.email);
   await CacheStorageService.instance.write(Constants.userName, userName);
  }


  Future<String> getUserData() async {
   String screenName = "";
   var userID = _auth.currentUser!.uid;
   String currentEmail = _auth.currentUser!.email ?? "";
   debugPrint("User ID getUserId $userID");
   var userDoc = await firestore
       .collection(Constants.usersCollection)
       .doc(userID)
       .get();
   if (userDoc.exists) {
    userModel.value = UserModel.fromMap(userDoc.data()!);
    if (currentEmail.isNotEmpty && userModel.value.email != currentEmail) {
     await updateEmailinUserDoc(currentEmail);
    }
    await cacheUserData();
   } else {
    screenName = "User not found. Please sign up.";
   }
   return screenName;
  }

  clearData() {
   emailController.value.clear();
   passwordController.value.clear();
   confirmPasswordController.value.clear();
   nameController.value.clear();
   lastNameController.value.clear();
   userModel.value = UserModel.empty();
   phoneNumberController.value.clear();
   phoneOTPController.value.clear();
  }

  Future<String> signUp() async {
   try {
    int timestamp = Timestamp.now().millisecondsSinceEpoch;
    String email = emailController.value.text.trim().toLowerCase();
    String firstName = nameController.value.text.trim();
    String lastName = lastNameController.value.text.trim();
    String userName = userNameController.value.text.trim();
    await _auth.createUserWithEmailAndPassword(
     email: email,
     password: passwordController.value.text.trim(),
    );
    userModel.value = UserModel(
     id: _auth.currentUser!.uid,
     email: email,
     firstName: firstName,
     lastName: lastName,
     userName: userName,
     fcmToken: "",
     timezone: "",
     emailVerified: false,
     userInfoModel: UserInfoModel.empty(),
     createdAt: timestamp,
     updatedAt: 0,
     textScaleFactor: 1.0,

     ///Temporary add completed
     status: Constants.completed,
    );
    await firestore
        .collection(Constants.usersCollection)
        .doc(_auth.currentUser!.uid)
        .set(userModel.value.toMap());
    await cacheUserData();
    await CacheStorageService.instance.write(Constants.isFirst, true);
    _auth.currentUser!.sendEmailVerification();
    return "";
   } on FirebaseAuthException catch (e) {
    debugPrint("eeee${e.code}");
    if (e.code == "weak-email-already-in-use") {
     return "email is already exist";
    }
    return e.message!;
   }
  }





  Future<String> signInWithEmail() async {
   String errorMessage = "";
   try {
    debugPrint(emailControllerLogin.value.text.trim().toLowerCase());
    debugPrint(passwordControllerLogin.value.text.trim().toLowerCase());
    await _auth.signInWithEmailAndPassword(
        email: emailControllerLogin.value.text.trim().toLowerCase(),
        password: passwordControllerLogin.value.text.trim());
    await CacheStorageService.instance
        .write(Constants.userId, _auth.currentUser!.uid.toString());
    await reloadUserData();
    if (_auth.currentUser == null || _auth.currentUser!.uid.isEmpty) {
     errorMessage = "Enter valid email and password";
    }
    return errorMessage;
   } on FirebaseAuthException catch (e) {
    if (e.code == "INVALID_LOGIN_CREDENTIALS") {
     errorMessage = "invalid email or password";
    } else {
     debugPrint("eeee${e.code}");
     errorMessage = e.code;
    }
    return errorMessage;
   }
  }



  Future<void> updateUser() async {
   // Get user ID from cache storage
   String userId = CacheStorageService.instance.read(Constants.userId) ?? "";
   if (userId.isEmpty) {
    // Handle case where user ID is not available
    return;
   }

   // Get current timestamp
   int timestamp = Timestamp.now().millisecondsSinceEpoch;
   // Check if user image is present and update if necessary
   if (newUserModel.value.imageBytes != null &&
       newUserModel.value.imageBytes!.isNotEmpty) {
    Uint8List bytes = newUserModel.value.imageBytes!;
    String path = "$userId/${Constants.profileImage}";
    String contentType = "image/jpeg";
    // Upload image to Firebase Storage
    StorageUploadMetadataModel returnData =
    await firebaseStorageController.storageService.putData(
     bytes: bytes,
     path: path,
     contentType: contentType,
    );

    // Update user model with image information
    userModel.value.imagePath = returnData.path;
    userModel.value.imageUrl = returnData.url;

    // Delete old metadata doc and create new one
    await firebaseStorageController.deleteMetadataDoc(path: path);
    await firebaseStorageController.createMetadataDoc(
     metadata: StorageFileMetadataModel(
      path: returnData.path,
      url: returnData.url,
      contentType: contentType,
      size: bytes.length,
      formattedSize: firebaseStorageController.storageService
          .formatBytes(bytes.length),
      extension: "jpg",
      referenceType: Constants.account,
      referenceId: userId,
      createdAt: timestamp,
     ),
    );

    // Reset image bytes
    newUserModel.value.imageBytes = null;
   }

   // Update user model with other information
   userModel.value.firstName = nameController.value.text;
   userModel.value.lastName = lastNameController.value.text;
   userModel.value.userName = userNameController.value.text;
   userModel.value.updatedAt = timestamp;

   // Update user document in Firestore
   await firestore
       .collection(Constants.usersCollection)
       .doc(userId)
       .update(userModel.value.toMap());

   // Reload user data if needed
   reloadUserData();
  }
  Future<void> updateUserInfo(UserInfoModel userInfoModel) async {
   // Get user ID from cache storage
   String userId = CacheStorageService.instance.read(Constants.userId) ?? "";
   if (userId.isEmpty) {
    // Handle case where user ID is not available
    return;
   }

   // Get current timestamp
   int timestamp = Timestamp.now().millisecondsSinceEpoch;
   // Check if user image is present and update if necessary
   userModel.value.userInfoModel=userInfoModel;
   userModel.value.updatedAt= timestamp;
   userModel.refresh();
   // Update user document in Firestore
   await firestore
       .collection(Constants.usersCollection)
       .doc(userId)
       .update(userModel.value.toMap());
   // Reload user data if needed
   reloadUserData();
  }

  getUser() async {
   String userId = CacheStorageService.instance.read(Constants.userId) ?? "";
   if (userId.isNotEmpty) {
    DocumentSnapshot<Map<String, dynamic>> userDoc = await firestore
        .collection(Constants.usersCollection)
        .doc(userId)
        .get();

    if (userDoc.exists) {
     userModel.value = UserModel.fromMap(userDoc.data()!);
     userModel.refresh();
    }
   }
  }


  Future<String> forgetPassword({String email = ""}) async {
   String errorMessage = "";
   String userEmail = email;
   if (userEmail.isEmpty) {
    userEmail = forgotPasswordController.value.text.trim();
   }
   try {
    await _auth.sendPasswordResetEmail(
     email: userEmail,
    );
   } on FirebaseAuthException catch (e) {
    if (e.code == "user-not-found") {
     errorMessage = "This email address is not registered ";
    }
    errorMessage = e.message ?? "Error";
   }
   return errorMessage;
  }

  Future<String> updateUserEmail(String newEmail) async {
   final user = firebaseAuth.currentUser;
   String errorMessage = "Error updating email: ";
   if (user != null) {
    user.reload();
    bool emailVerify=user.emailVerified;
    try {
     if(emailVerify) {
      await user.verifyBeforeUpdateEmail(newEmail);
      await user.reload();
      await user.sendEmailVerification();
      await updateEmailinUserDoc(newEmail);
     }else{
      user.sendEmailVerification();
      return "please email verify after change a email";
     }
     return "";
    } on FirebaseAuthException catch (e) {
     if (e.code == "invalid-email") {
      return "${errorMessage}invalid email";
     } else if (e.code == "email-already-in-use") {
      return "${errorMessage}email already in use";
     } else if (e.code == "requires-recent-login") {
      return "${errorMessage}please log out and log in again";
     }
    }
   }
   return "${errorMessage}no user logged in";
  }

  updateEmailinUserDoc(String newEmail) async {
   String userId = userModel.value.id;
   userModel.value.email = newEmail;
   userModel.value.emailVerified = true;
   if (userId.isNotEmpty) {
    await firestore
        .collection(Constants.usersCollection)
        .doc(userId)
        .update(userModel.value.toMap());
    await CacheStorageService.instance.write(Constants.userEmail, newEmail);
   }
  }

  Future<String> updateUserPassword({
   required String currentPassword,
   required String newPassword,
  }) async {
   final user = firebaseAuth.currentUser;
   String errorMessage = "Error updating password: ";
   if (user != null) {
    final credential = EmailAuthProvider.credential(
     email: user.email!,
     password: currentPassword,
    );
    try {
     await user.reauthenticateWithCredential(credential);
     await user.updatePassword(newPassword);
     return "";
    } on FirebaseAuthException catch (e) {
     if (e.code == "weak-password") {
      return "${errorMessage}weak password";
     } else if (e.code == "requires-recent-login") {
      return "${errorMessage}please log out and log in again";
     } else if (e.code == "wrong-password") {
      return "${errorMessage}wrong password";
     }
    }
   }
   return "${errorMessage}no user logged in";
  }

  logoutUser({required bool forceLogout}) async {
   if (firebaseAuth.currentUser != null || forceLogout) {
    await CacheStorageService.instance.erase();
    // remove google tokens when signing out.
    await secureStorage.write(key: 'google_access_token', value: "");
    await secureStorage.write(key: 'google_refresh_token', value: '');
    await Get.deleteAll();
    await firebaseAuth.signOut();
    clearData();
    //  Get.offAll(
    //       () => const LoginView(),
    //  );
    // }
   }

   Future<String> deleteUserAccount() async {
    try {
     User? user = firebaseAuth.currentUser;
     user?.reload();
     if (user != null) {
      String userId =
      await CacheStorageService.instance.read(Constants.userId);
      bool emailIsVerified = user.emailVerified;
      if (emailIsVerified) {
       if (userId.isNotEmpty) {
        if (userModel.value.imageUrl.isNotEmpty) {
         await firestore
             .collection(Constants.usersCollection)
             .doc(userId)
             .collection(Constants.firebaseStorageMetadataCollection)
             .doc(userId)
             .delete();
        }
        await firestore
            .collection(Constants.usersCollection)
            .doc(userId)
            .collection(Constants.selectedInterests)
            .doc(userId)
            .delete();
        // Now delete the user document
        await firestore
            .collection(Constants.usersCollection)
            .doc(userId)
            .delete();

        // Finally, delete the user
        await user.delete();
        // Sign out the user
        await firebaseAuth.signOut();
        clearData();
        return "";
       }
       return "No user found";
      } else {
       user.sendEmailVerification();
       return "please email verification after delete account";
      }
     }
     return "No user signed in";
    } on FirebaseAuthException catch (e) {
     if (e.code == "requires-recent-login") {
      return "Please logout and login again";
     }
     return e.code;
    }
   }

   void getImage({
    required ImageSource imageSource,
    required BuildContext context,
    bool isFile = false,
   }) async {
    try {
     var imageBytes = await firebaseStorageController.getImage(
      imageSource: imageSource,
      isFile: isFile,
     );

     if (imageBytes != null && imageBytes.isNotEmpty) {
      newUserModel.value.imageBytes = imageBytes;
      newUserModel.refresh();
      Get.back();
     } else {
      // Handle the case where imageBytes is null or empty
      if (kDebugMode) {
       print('Error: Image bytes are null or empty.');
      }
     }
    } catch (e) {
     // Handle any exceptions that occur during image retrieval
     if (kDebugMode) {
      print('Error fetching image: $e');
     }
    }
   }
  }}