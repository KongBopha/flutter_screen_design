import 'package:flutter/material.dart';
import 'package:flutter_testing/presentation/views/screens/homescreen.dart';
import 'package:flutter_testing/presentation/views/widgets/textcontroller_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text("Create your account",),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
            height: 200,
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
              height: 300,
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

            SizedBox(height: 15,),
            SizedBox(
              height: 40,
              width: 150,
              child:ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: Text('Login'),
            ),
            ),
            SizedBox(height: 5,),
            const Text("Or"),
            SizedBox(
              width: 150,
              height: 70,
              child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/google.png",
                    height: 30,
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    "assets/facebook.png",
                    height: 30,
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    "assets/twitter.png",
                    height: 30,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            ),
            RichText(
              text: TextSpan(
                text: 'Don\'t have an account ? ',
                style: TextStyle(color: Colors.black, fontSize: 14), 
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurpleAccent,fontSize: 14),  
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Don\'t have an account ?'),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Homescreen(),
                    ),);
                  }, 
                  child: Text('Sign Up'))
              ],
            ),
          ],
      ),
      ),
    );
  }
}