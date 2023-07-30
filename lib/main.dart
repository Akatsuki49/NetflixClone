import 'package:flutter/material.dart';
import 'package:netflixclone/pages/login.dart';
import 'package:netflixclone/pages/navigator.dart';
import './pages/splas_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splashscreen(),
  ));
}


//PROJECT OVER, WAS INDEED A FUN LEARNING EXPERIENCE 🎉