import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasty_food/screens/home_screen.dart';
import 'package:tasty_food/screens/slider.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      if(FirebaseAuth.instance.currentUser != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SliderScreen(),));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.orange,
          child: Container(
            width: double.infinity,
            height: double.infinity, 
            decoration: const BoxDecoration(color:Colors.white,
              borderRadius:BorderRadius.only(bottomRight: Radius.elliptical(600, 200)),
             ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png",height: MediaQuery.of(context).size.height * 0.3,width: MediaQuery.of(context).size.width * 0.7,),
                 const Text("TASTY",style: TextStyle(fontFamily: 'one',color: Colors.orange,fontSize: 60,letterSpacing: 15),),
                 const Text("FOOD ZONE",style: TextStyle(fontFamily: 'one',color: Colors.orange,fontSize: 25,letterSpacing: 4)),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
