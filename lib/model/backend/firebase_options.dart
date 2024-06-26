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
    apiKey: 'AIzaSyCx0SKOGDAnyfkhnNETbBU1BvT0ZbzxBlA',
    appId: '1:813888667559:web:305cbac694b5315823c082',
    messagingSenderId: '813888667559',
    projectId: 'turf-booking-application-spot',
    authDomain: 'turf-booking-application-spot.firebaseapp.com',
    storageBucket: 'turf-booking-application-spot.appspot.com',
    measurementId: 'G-0CMMTXWLEL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCzt9ReBp-9zjT-n8oYo7N0f_KNgKLiNFk',
    appId: '1:813888667559:android:6113d3d90a80775123c082',
    messagingSenderId: '813888667559',
    projectId: 'turf-booking-application-spot',
    storageBucket: 'turf-booking-application-spot.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZu88cBT-oNMua-txzp84952ZQBbx7AWg',
    appId: '1:813888667559:ios:d8568bb75fb72fee23c082',
    messagingSenderId: '813888667559',
    projectId: 'turf-booking-application-spot',
    storageBucket: 'turf-booking-application-spot.appspot.com',
    iosBundleId: 'amina.ownersSideOfTurfBooking',
  );
}
