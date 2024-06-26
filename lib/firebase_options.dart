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
    apiKey: 'AIzaSyDSsbVo2_1VaPxNf4f8AMZGsAish96Dhmo',
    appId: '1:953388681501:web:e4b5afb434a3af28e279f4',
    messagingSenderId: '953388681501',
    projectId: 'my-db-prjct',
    authDomain: 'my-db-prjct.firebaseapp.com',
    storageBucket: 'my-db-prjct.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCYOnASnblP7fHvE6fheUzL6e3bo2czuNs',
    appId: '1:953388681501:android:86c0247105a8639be279f4',
    messagingSenderId: '953388681501',
    projectId: 'my-db-prjct',
    storageBucket: 'my-db-prjct.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAV3X0VwrL7cpsUkywcNoeJEbKxNG8oBcI',
    appId: '1:953388681501:ios:6855e372df6000aee279f4',
    messagingSenderId: '953388681501',
    projectId: 'my-db-prjct',
    storageBucket: 'my-db-prjct.appspot.com',
    iosBundleId: 'com.example.sampleProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAV3X0VwrL7cpsUkywcNoeJEbKxNG8oBcI',
    appId: '1:953388681501:ios:2a0d396a29c62157e279f4',
    messagingSenderId: '953388681501',
    projectId: 'my-db-prjct',
    storageBucket: 'my-db-prjct.appspot.com',
    iosBundleId: 'com.example.sampleProject.RunnerTests',
  );
}
