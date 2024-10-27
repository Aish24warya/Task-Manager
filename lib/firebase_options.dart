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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBN7FdvPioI_9t-noEheuDjOA6PS-Mo-0M',
    appId: '1:781268484677:web:174b0fcfe393a82623992c',
    messagingSenderId: '781268484677',
    projectId: 'taskmanager-90796',
    authDomain: 'taskmanager-90796.firebaseapp.com',
    storageBucket: 'taskmanager-90796.appspot.com',
    measurementId: 'G-FMFGMW2LYC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD4S3_zl3nVAuV5tQlQ4DYwzt36ybCjRGc',
    appId: '1:781268484677:android:e25ddd24e896a41323992c',
    messagingSenderId: '781268484677',
    projectId: 'taskmanager-90796',
    storageBucket: 'taskmanager-90796.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFTuY2KOYxW4Si_18pHbq93cyRgpWfIwg',
    appId: '1:781268484677:ios:2395c48b2c59daf123992c',
    messagingSenderId: '781268484677',
    projectId: 'taskmanager-90796',
    storageBucket: 'taskmanager-90796.appspot.com',
    iosBundleId: 'com.selfpro.taskmanage',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDFTuY2KOYxW4Si_18pHbq93cyRgpWfIwg',
    appId: '1:781268484677:ios:2395c48b2c59daf123992c',
    messagingSenderId: '781268484677',
    projectId: 'taskmanager-90796',
    storageBucket: 'taskmanager-90796.appspot.com',
    iosBundleId: 'com.selfpro.taskmanage',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBN7FdvPioI_9t-noEheuDjOA6PS-Mo-0M',
    appId: '1:781268484677:web:61e95c8ac76918aa23992c',
    messagingSenderId: '781268484677',
    projectId: 'taskmanager-90796',
    authDomain: 'taskmanager-90796.firebaseapp.com',
    storageBucket: 'taskmanager-90796.appspot.com',
    measurementId: 'G-BQNGMCSPF9',
  );
}
