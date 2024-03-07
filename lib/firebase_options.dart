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
    apiKey: 'AIzaSyAyc_QSAWp65pAe77N8yf6MWKAPyRPlzbQ',
    appId: '1:673031898381:web:63eaa11d71da80c2b09c44',
    messagingSenderId: '673031898381',
    projectId: 'range-universe-mobile',
    authDomain: 'range-universe-mobile.firebaseapp.com',
    storageBucket: 'range-universe-mobile.appspot.com',
    measurementId: 'G-ZHMFJMSV5S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBj-HhkqTGReJ1zOcdRkDSgOcfEHaIGQgA',
    appId: '1:673031898381:android:1a4fc627d41289dcb09c44',
    messagingSenderId: '673031898381',
    projectId: 'range-universe-mobile',
    storageBucket: 'range-universe-mobile.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDTlfpFmXHSJFc2OO3k95oeC6KG4F7k378',
    appId: '1:673031898381:ios:5f694fd06e9cb73fb09c44',
    messagingSenderId: '673031898381',
    projectId: 'range-universe-mobile',
    storageBucket: 'range-universe-mobile.appspot.com',
    androidClientId: '673031898381-fbf4adn69h6ffnrmknsriuifmatknp8p.apps.googleusercontent.com',
    iosClientId: '673031898381-mhedro8pqi004g51nu1aokkscvgoc9tg.apps.googleusercontent.com',
    iosBundleId: 'com.example.rangeuniverse',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDTlfpFmXHSJFc2OO3k95oeC6KG4F7k378',
    appId: '1:673031898381:ios:e798ad597b9fff64b09c44',
    messagingSenderId: '673031898381',
    projectId: 'range-universe-mobile',
    storageBucket: 'range-universe-mobile.appspot.com',
    androidClientId: '673031898381-fbf4adn69h6ffnrmknsriuifmatknp8p.apps.googleusercontent.com',
    iosClientId: '673031898381-429d46e4hr77c4ohap88rkf8dmculccf.apps.googleusercontent.com',
    iosBundleId: 'com.example.rangeuniverse.RunnerTests',
  );
}
