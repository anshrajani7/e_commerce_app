// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCVbrwkoh32FRhBxX_6XJggL6KnVQrKk3k',
    appId: '1:33664201286:web:67a0615f72c83a20fe9047',
    messagingSenderId: '33664201286',
    projectId: 'example-e9b37',
    authDomain: 'example-e9b37.firebaseapp.com',
    storageBucket: 'example-e9b37.appspot.com',
    measurementId: 'G-HE1CNMB61P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAB7-0BX1RKHuQWROLJt0fUNlALKocCQmo',
    appId: '1:33664201286:android:0f5b1c1be81643c8fe9047',
    messagingSenderId: '33664201286',
    projectId: 'example-e9b37',
    storageBucket: 'example-e9b37.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAeRG0qJtVlcMZAaSV8fnmJ7d_nJyTF23k',
    appId: '1:33664201286:ios:8c9f14b0bea078d1fe9047',
    messagingSenderId: '33664201286',
    projectId: 'example-e9b37',
    storageBucket: 'example-e9b37.appspot.com',
    iosBundleId: 'com.example.eCommerceApp',
  );
}