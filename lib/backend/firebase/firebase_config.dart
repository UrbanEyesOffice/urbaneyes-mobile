import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC_dBFkadV44P88crfLTN4ymc4mHRzVzfY",
            authDomain: "urbaneyes-a6d94.firebaseapp.com",
            projectId: "urbaneyes-a6d94",
            storageBucket: "urbaneyes-a6d94.appspot.com",
            messagingSenderId: "8078048766",
            appId: "1:8078048766:web:d1b71fe3c6c4648e9194af",
            measurementId: "G-DENHB3H27P"));
  } else {
    await Firebase.initializeApp();
  }
}
