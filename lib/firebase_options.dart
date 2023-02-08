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
    apiKey: 'AIzaSyBrJScKViu4gd81F5bXeqKW-Em0d-ueIVE',
    appId: '1:668982061367:web:beb85b65be69f9171e92b2',
    messagingSenderId: '668982061367',
    projectId: 'aniquiz-4237a',
    authDomain: 'aniquiz-4237a.firebaseapp.com',
    storageBucket: 'aniquiz-4237a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0fZugPGciOUPJdBC3nTkLpOb0tYwLUAo',
    appId: '1:668982061367:android:aea1a69523161d741e92b2',
    messagingSenderId: '668982061367',
    projectId: 'aniquiz-4237a',
    storageBucket: 'aniquiz-4237a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAOXV7UjCHjDtpFXCnF_uG3RMJJmkDmD94',
    appId: '1:668982061367:ios:43d269a59a3aa29e1e92b2',
    messagingSenderId: '668982061367',
    projectId: 'aniquiz-4237a',
    storageBucket: 'aniquiz-4237a.appspot.com',
    iosClientId: '668982061367-0rcs0tr72nr2tea3g7fg4l1khnlg1kl5.apps.googleusercontent.com',
    iosBundleId: 'com.example.aniquiz',
  );
}