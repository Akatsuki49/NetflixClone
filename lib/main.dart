import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/pages/navigator.dart';

import './pages/splas_screen.dart';
import './pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // await FirebaseAuth.instance.signInAnonymously();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splashscreen(),
  ));
}
