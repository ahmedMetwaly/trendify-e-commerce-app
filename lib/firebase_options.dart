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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBPQcFFLWBj-rb8NhwXoK_KIYbr5e73a2A',
    appId: '1:437117649414:android:fbfcfacea361160aa77987',
    messagingSenderId: '437117649414',
    projectId: 'trendify-5ffe2',
    storageBucket: 'trendify-5ffe2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhI_jJu0DGuHRQfIT0WX-5CUX65ZTeFuc',
    appId: '1:437117649414:ios:3a881e71e26594f0a77987',
    messagingSenderId: '437117649414',
    projectId: 'trendify-5ffe2',
    storageBucket: 'trendify-5ffe2.appspot.com',
    androidClientId: '437117649414-5dgvqalvbq5qp55o2iacvnnigm4n7hvv.apps.googleusercontent.com',
    iosClientId: '437117649414-6v5cf978qro5s06kg9rgjfp3ik05dgkr.apps.googleusercontent.com',
    iosBundleId: 'com.example.shopApp',
  );
}
