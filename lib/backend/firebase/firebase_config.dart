import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDkl95HyEjzY403P6vsNEDggvdh5kAg2rM",
            authDomain: "whistl-d-app.firebaseapp.com",
            projectId: "whistl-d-app",
            storageBucket: "whistl-d-app.appspot.com",
            messagingSenderId: "927859253118",
            appId: "1:927859253118:web:ae45a845c769f7dbef5d2f",
            measurementId: "G-QECTPDDSTC"));
  } else {
    await Firebase.initializeApp();
  }
}
