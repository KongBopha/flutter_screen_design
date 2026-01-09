import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconlabelWidget extends StatelessWidget {
  final String img;
  final String label;
  const IconlabelWidget({
    super.key,
    required this.img,
    required this.label
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(50.0),
        image: DecorationImage(
          image: AssetImage(img),
          
          ),
      ),
      child: Text(img),
    );
  }
}