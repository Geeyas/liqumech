import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyABUWSz6fw_ypOsZn0an4I3ZR6b0ufUbQg",
            authDomain: "liquimechcloudlogin.firebaseapp.com",
            projectId: "liquimechcloudlogin",
            storageBucket: "liquimechcloudlogin.appspot.com",
            messagingSenderId: "731764880289",
            appId: "1:731764880289:web:128b8eadbe36f3b7be11e0",
            measurementId: "G-TNJE6D8N9Q"));
  } else {
    await Firebase.initializeApp();
  }
}
