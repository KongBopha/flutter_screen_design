import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_testing/presentation/views/widgets/bottomnavigatebar_widget.dart';
import 'package:flutter_testing/presentation/views/widgets/textcontroller_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title:  Text("Create your account",style: TextStyle(fontSize: 20.sp),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://e7.pngegg.com/pngimages/227/811/png-clipart-freelancer-sole-proprietorship-workplace-employment-tax-copywriter-purple-violet.png"),
                  fit: BoxFit.cover
                ),
            ),
            child: Transform.translate(
              offset: const Offset(0.0, 170.0),
              child: Container(
              height: 300.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top:BorderSide(color: Colors.white60, width: 2.0),  
                ),
                borderRadius: BorderRadius.only(
                  topLeft:  Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
    
              ),
            ),
            ),
           ),
            TextcontrollerWidget(), 
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('Forget Password?'),
              ),
            ),

            SizedBox(height: 15.h,),
            SizedBox(
              height: 50.h,
              width: 150.w,
              child:ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => const BottomnavigatebarWidget(),)
                  );
              },
              child: Text('Login',  style: TextStyle(fontSize: 16.sp,),
              ),
            ),
            ),
            SizedBox(height: 5.h,),
            const Text("Or"),
            SizedBox(
              width: 150.w,
              height: 70.h,
              child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/google.png",
                    height: 30.h,
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    "assets/facebook.png",
                    height: 30.h,
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    "assets/twitter.png",
                    height: 30.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            ),
            RichText(
              text: TextSpan(
                text: 'Don\'t have an account ? ',
                style: TextStyle(color: Colors.black, fontSize: 14.sp), 
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurpleAccent,fontSize: 14.sp),  
                  ),
                ],
              ),
            )
          ],
      ),
      ),
    );
  }
}