import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_testing/domain/models/productvariants_model.dart';
import 'package:flutter_testing/presentation/views/widgets/variant_toggle_button_widget.dart';

class VariantCardWidget extends StatelessWidget {
  final String imageUrl; 
  final String name;  
  final double price; 
  final int soldCount;
  final int availableStock;
  final ProductVariantModel variant; 
  final bool isToggled;
  final ValueChanged<bool> onToggle;

  const VariantCardWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.soldCount,
    required this.availableStock,
    required this.variant,
    required this.isToggled,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, width: 80, fit: BoxFit.contain),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('\$$price', style:  TextStyle(fontSize: 16.sp,color: Colors.black)),
                  SizedBox(height: 8.h),
                  Text(name, style:  TextStyle(fontSize: 16.sp,color: Colors.black)),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text('$soldCount Sold', style: const TextStyle(color: Colors.grey)),
                      SizedBox(width: 8.w),
                      Text('$availableStock Available', style: const TextStyle(color: Colors.green)),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      // Show color and size
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text('Color: ${variant.color}',style: TextStyle(color: Colors.black),),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text('Size: ${variant.size}',style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  VariantToggleButton(isToggled: isToggled, onChanged: onToggle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
