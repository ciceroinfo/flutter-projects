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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBHPDgOZH8AzEeZuMf-UH0tUfsnkTIH_Mc',
    appId: '1:251357435549:web:65ed6f719b103496b82674',
    messagingSenderId: '251357435549',
    projectId: 'flutter-memory-game',
    authDomain: 'flutter-memory-game.firebaseapp.com',
    databaseURL: 'https://flutter-memory-game-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-memory-game.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxVyUGKne9TQLEgP2_1AtgbraMiiOK5WA',
    appId: '1:251357435549:android:c499e554bc04c316b82674',
    messagingSenderId: '251357435549',
    projectId: 'flutter-memory-game',
    databaseURL: 'https://flutter-memory-game-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-memory-game.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAKhuNcg20Fyl5PyaIcJctks-kt1T9eYM4',
    appId: '1:251357435549:ios:33fa04b248f469e5b82674',
    messagingSenderId: '251357435549',
    projectId: 'flutter-memory-game',
    databaseURL: 'https://flutter-memory-game-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-memory-game.appspot.com',
    iosClientId: '251357435549-0eoh8dpsmcqc5iakp5j4klhqfg5bh5oo.apps.googleusercontent.com',
    iosBundleId: 'com.ciceroinfo.flutterMemoryGame',
  );
}
