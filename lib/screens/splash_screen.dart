import 'package:flutter/material.dart';
import 'dart:async';
import 'choose_device_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, navigateToDeviceScreen);
  }

  navigateToDeviceScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ChooseDeviceScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("HOMEBREW", style: TextStyle(fontFamily: "Norwester", fontSize: 48, color: Color(0xffFFFFFF))),
            Text("Great Coffee at Home", style:TextStyle(fontFamily: "Kollektif" , fontSize: 18,color: Color(0xffFFFFFF)))],
        ),
      ),
      backgroundColor: const Color(0xff4C748B),
    );
  }
}
