import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:footwear/Activity/Home%20Screen.dart';
import 'package:footwear/Authentication/Login%20Screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  CheckUser() {
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user != null){
      Timer(const Duration(seconds: 5), (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      });
    } 
    else{
      Timer(const Duration(seconds: 5), (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      });

    }
  }

  @override
  void initState() {
    CheckUser();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Foot Wear",
                style: GoogleFonts.jotiOne(
                    textStyle: const TextStyle(
                  fontSize: 32,
                  color: Color(
                    0xff991e66,
                  ),
                ))),
            const SizedBox(
              height: 20,
            ),
            LoadingAnimationWidget.twistingDots(
              leftDotColor: const Color(0xFF991e66),
              rightDotColor: const Color(0xFF426b69),
              size: 70,
            ),
          ],
        ),
      ),
    );
  }
}
