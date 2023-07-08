import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDvArNoZQ6qRn1ypBoc3MPzdY0UpYzGx5o",
            authDomain: "e-learning-guinea.firebaseapp.com",
            projectId: "e-learning-guinea",
            storageBucket: "e-learning-guinea.appspot.com",
            messagingSenderId: "629602019077",
            appId: "1:629602019077:web:8abf488e1e77428a2a796c",
            measurementId: "G-THXHXYCCM9"));
  } else {
    await Firebase.initializeApp();
  }
}
