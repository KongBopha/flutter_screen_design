import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_testing/domain/models/product_details_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({
    super.key,
    required this.model,
  });

  final ProductDetailsModel model;

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  bool _showMore = false;

  @override
  Widget build(BuildContext context) {
    final model = widget.model;

    return Padding(
      padding:  EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '\$${model.discountedPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                '\$${model.price.toStringAsFixed(2)}',
                style:  TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red[800],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${model.discountPercent.toStringAsFixed(0)}% ',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

           SizedBox(height: 8.h),

          Text(
            model.name,
            style:  TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          SizedBox(height: 6.h),
          Row(
            children: [
              Text(
                '${model.soldCount.toInt()} Sold',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
              SizedBox(width: 10.w),
              Text(
                '${model.availableStock.toInt()} Available',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          InkWell(
            onTap: () {
              setState(() {
                _showMore = !_showMore;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  'Product details',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Icon(
                  _showMore ? Icons.expand_less : Icons.expand_more,
                ),
              ],
            ),
          ),

          // ================= Collapsible Content =================
          if (_showMore) ...[
            SizedBox(height: 8.h),
            Row(
              children: [
                Text(
                  "Code: ${model.code.toInt()}",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(width: 20.w),
                IconButton(
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(text: model.code.toString()),
                    ).then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Copied!',style: TextStyle(color: Colors.redAccent),),backgroundColor: Colors.white,),
                      );
                    });
                  },
                  icon: const Icon(Icons.copy),
                  color: Colors.grey,
                ),
              ],
            ),

             SizedBox(height: 4.h),
            Text(
              model.description,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 12.h),
          ],
           Text(
            'Product Options',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.h),

          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[50],
                ),
                onPressed: () {},
                child:   Text(
                  'Size',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(width: 14.w),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[50],
                ),
                onPressed: () {},
                child: Text(
                  'Color',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
