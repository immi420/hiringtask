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
    apiKey: 'AIzaSyCcOBowNrBnbngg5Nz_ACwcB7prJ56X8m8',
    appId: '1:778492137587:web:b7a251e89bbac1b11fda06',
    messagingSenderId: '778492137587',
    projectId: 'mytask-3a21d',
    authDomain: 'mytask-3a21d.firebaseapp.com',
    storageBucket: 'mytask-3a21d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAt5i1iV0A6x89udQ4bPP2eGLg26Ga3czY',
    appId: '1:778492137587:android:4dbc8a49ad2824c31fda06',
    messagingSenderId: '778492137587',
    projectId: 'mytask-3a21d',
    storageBucket: 'mytask-3a21d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCXxZO41tc9v0K-aB13IKrhF8c4PsrkFzk',
    appId: '1:778492137587:ios:0b30e580a59516131fda06',
    messagingSenderId: '778492137587',
    projectId: 'mytask-3a21d',
    storageBucket: 'mytask-3a21d.appspot.com',
    iosClientId: '778492137587-74o933crl639luhc2nso7necb2i0nm28.apps.googleusercontent.com',
    iosBundleId: 'com.immidev.hiringtask',
  );
}
