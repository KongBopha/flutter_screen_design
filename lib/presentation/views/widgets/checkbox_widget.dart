import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckboxWidget extends StatelessWidget {
  const CheckboxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(  
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/checkbox.png"),fit: BoxFit.contain,),
          ),
        ),
        const Text("Congratulation",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
        SizedBox(height: 16.h,),
        const Text("Your product has been created successfully.",style: TextStyle(color: Colors.black,fontSize: 12, ),),
      ],
    );
  }
}