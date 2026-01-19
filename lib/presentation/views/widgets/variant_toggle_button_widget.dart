import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

class VariantToggleButton extends StatelessWidget {
  final bool isToggled;
  final ValueChanged<bool> onChanged;

  const VariantToggleButton({
    super.key,
    required this.isToggled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Active",
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 12.w),
          FlutterSwitch(
            value: isToggled,
            onToggle: onChanged,
            width: 48.w,
            height: 24.h,
            toggleSize: 20.h,
            borderRadius: 30,
            padding: 2,
            activeColor: Colors.blue.shade200 ,
            inactiveColor: Colors.grey.shade300,
            toggleColor: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
