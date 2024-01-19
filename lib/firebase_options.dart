// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyDddjiyGEUMZBGG4v6IWkojXYRsXfFQHQA',
    appId: '1:223359858908:web:3df6e4895bd45d9fbd1c19',
    messagingSenderId: '223359858908',
    projectId: 'crud-7d819',
    authDomain: 'crud-7d819.firebaseapp.com',
    storageBucket: 'crud-7d819.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSAQ8cF0VihXbP4UEbNgHVjSPZzI-VzRQ',
    appId: '1:223359858908:android:ec50d2095a8253a7bd1c19',
    messagingSenderId: '223359858908',
    projectId: 'crud-7d819',
    storageBucket: 'crud-7d819.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCyg84xSTsilSahK1vN2wDbMLohYo0iHYI',
    appId: '1:223359858908:ios:f8f1b90cc07653cebd1c19',
    messagingSenderId: '223359858908',
    projectId: 'crud-7d819',
    storageBucket: 'crud-7d819.appspot.com',
    iosBundleId: 'com.example.crud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCyg84xSTsilSahK1vN2wDbMLohYo0iHYI',
    appId: '1:223359858908:ios:f8f1b90cc07653cebd1c19',
    messagingSenderId: '223359858908',
    projectId: 'crud-7d819',
    storageBucket: 'crud-7d819.appspot.com',
    iosBundleId: 'com.example.crud',
  );
}