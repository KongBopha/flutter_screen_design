import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_testing/presentation/views/screens/login_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState(){
    super.initState();
    navigateToHomeScreen();
  }
    Future<void> navigateToHomeScreen() async{
    await Future.delayed(const Duration(seconds: 3));
    if(mounted){
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context)=> const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Container(
            height: 200.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/splash.png"),
            fit: BoxFit.contain,
            ),
        ),
      ),
        ],
      ),
    );
  }
}