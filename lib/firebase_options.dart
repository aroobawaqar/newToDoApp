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
    apiKey: 'AIzaSyBf9tpjSNpEF22WhRvnDqb8dmqOUU7mYSo',
    appId: '1:829170441684:web:0360b859594d71af980a41',
    messagingSenderId: '829170441684',
    projectId: 'addapp-78ee1',
    authDomain: 'addapp-78ee1.firebaseapp.com',
    storageBucket: 'addapp-78ee1.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBzGgLJsPKgGyJzTET0hi8McngY09ubl4o',
    appId: '1:829170441684:android:b0ed3739e3a4faa0980a41',
    messagingSenderId: '829170441684',
    projectId: 'addapp-78ee1',
    storageBucket: 'addapp-78ee1.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtHcMNvej-o7nQzIjO3dnxYrrnz6AlVTU',
    appId: '1:829170441684:ios:3e714402eff10875980a41',
    messagingSenderId: '829170441684',
    projectId: 'addapp-78ee1',
    storageBucket: 'addapp-78ee1.firebasestorage.app',
    iosBundleId: 'com.example.todoapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDtHcMNvej-o7nQzIjO3dnxYrrnz6AlVTU',
    appId: '1:829170441684:ios:3e714402eff10875980a41',
    messagingSenderId: '829170441684',
    projectId: 'addapp-78ee1',
    storageBucket: 'addapp-78ee1.firebasestorage.app',
    iosBundleId: 'com.example.todoapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBf9tpjSNpEF22WhRvnDqb8dmqOUU7mYSo',
    appId: '1:829170441684:web:3204656693a5fae6980a41',
    messagingSenderId: '829170441684',
    projectId: 'addapp-78ee1',
    authDomain: 'addapp-78ee1.firebaseapp.com',
    storageBucket: 'addapp-78ee1.firebasestorage.app',
  );
}
