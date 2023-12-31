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
    apiKey: 'AIzaSyDV5EZUnbaKDPKNDkx15dKPqgojrukHHJQ',
    appId: '1:584168823584:web:9e1de495cebd6c51d05545',
    messagingSenderId: '584168823584',
    projectId: 'flutterproject-79c39',
    authDomain: 'flutterproject-79c39.firebaseapp.com',
    storageBucket: 'flutterproject-79c39.appspot.com',
    measurementId: 'G-505S1SCGJH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3BuukcR52HlkffrU2-yL2i1zJgyyLcLs',
    appId: '1:584168823584:android:ba0b15f8a50b7229d05545',
    messagingSenderId: '584168823584',
    projectId: 'flutterproject-79c39',
    storageBucket: 'flutterproject-79c39.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDEfNOrbHqnHUcI2t9IgdSEqhTMZiNh_04',
    appId: '1:584168823584:ios:20c8259a97aca08fd05545',
    messagingSenderId: '584168823584',
    projectId: 'flutterproject-79c39',
    storageBucket: 'flutterproject-79c39.appspot.com',
    iosBundleId: 'com.example.firebaseauth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDEfNOrbHqnHUcI2t9IgdSEqhTMZiNh_04',
    appId: '1:584168823584:ios:da6092e9b2976c97d05545',
    messagingSenderId: '584168823584',
    projectId: 'flutterproject-79c39',
    storageBucket: 'flutterproject-79c39.appspot.com',
    iosBundleId: 'com.example.firebaseauth.RunnerTests',
  );
}
