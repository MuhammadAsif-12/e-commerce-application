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
    apiKey: 'AIzaSyDGq1Mth3VUCpF4k_CCFZoJf86oqEBDgNQ',
    appId: '1:257616940708:web:e8e788ee0c3ade631d6031',
    messagingSenderId: '257616940708',
    projectId: 'shopping-store0057',
    authDomain: 'shopping-store0057.firebaseapp.com',
    storageBucket: 'shopping-store0057.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBy5UfTLdyCWZdwje83v1_LjUzxtjBYUbs',
    appId: '1:257616940708:android:78f595dfa35254bf1d6031',
    messagingSenderId: '257616940708',
    projectId: 'shopping-store0057',
    storageBucket: 'shopping-store0057.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAGvRNJZ1pA_1jDT1Cq92Y8C-xaFtT7cQA',
    appId: '1:257616940708:ios:9f9e99b48b879a621d6031',
    messagingSenderId: '257616940708',
    projectId: 'shopping-store0057',
    storageBucket: 'shopping-store0057.appspot.com',
    iosBundleId: 'com.example.foodDeliveryApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAGvRNJZ1pA_1jDT1Cq92Y8C-xaFtT7cQA',
    appId: '1:257616940708:ios:9f9e99b48b879a621d6031',
    messagingSenderId: '257616940708',
    projectId: 'shopping-store0057',
    storageBucket: 'shopping-store0057.appspot.com',
    iosBundleId: 'com.example.foodDeliveryApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDGq1Mth3VUCpF4k_CCFZoJf86oqEBDgNQ',
    appId: '1:257616940708:web:3edafead49c7e8031d6031',
    messagingSenderId: '257616940708',
    projectId: 'shopping-store0057',
    authDomain: 'shopping-store0057.firebaseapp.com',
    storageBucket: 'shopping-store0057.appspot.com',
  );
}
