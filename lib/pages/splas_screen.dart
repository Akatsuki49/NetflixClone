import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:netflixclone/pages/navigator.dart';
import './login.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Lottie.asset(
          'assets/animations/splash.json',
          //repeat: true,
          frameRate: FrameRate(60),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(milliseconds: 3999), () {
      Navigator.push(
          this.context, MaterialPageRoute(builder: (context) => Login()));
    });
  }
}
//SEWY!!!!