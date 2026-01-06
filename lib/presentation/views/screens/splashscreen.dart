import 'package:flutter/material.dart';
import 'package:flutter_testing/presentation/views/screens/homescreen.dart';

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
      MaterialPageRoute(builder: (context)=> const Homescreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/slpash.png"),
            fit: BoxFit.contain,
            ),
        ),
      ),
        ],
      ),
    );
  }
}