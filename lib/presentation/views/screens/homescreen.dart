import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_testing/domain/models/product_details_model.dart';
import 'package:flutter_testing/presentation/views/widgets/griditem_widget.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductDetailsModel> products = [
      ProductDetailsModel(
        name: "Black Jacket with a white logo air-front for man",
        price: 100,
        discountedPrice: 80,
        discountPercent: 20,
        soldCount: 150,
        availableStock: 250,
        code: 123456,
        description: "Design for hiker is sunny weather. Protects you against the UVA/UVB from the sun. At the mean time windproof, lightweight, and breathable",
        images: [
          "https://unblast.com/wp-content/uploads/2020/04/Working-from-Home-Illustration.jpg",
          'https://i.pinimg.com/1200x/79/31/2d/79312d73ee60dff33099abe024c97809.jpg'
        ],
      ),
      ProductDetailsModel(
        name: "Work",
        price: 120,
        discountedPrice: 100,
        discountPercent: 15,
        soldCount: 200,
        availableStock: 150,
        code: 654321,
        description: "Work at office illustration",
        images: [
          "https://www.reshot.com/preview-assets/illustrations/YTDE63PFWG/working-on-3d-render-YTDE63PFWG-w600.jpg"
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.deepPurpleAccent,
            expandedHeight: 350.h,
            pinned: true,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.menu, color: Colors.white),
                          SizedBox(height: 16.h),
                          Text(
                            "Start Your\nWorkday\nComfortably",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.sp,
                              fontWeight: FontWeight.bold,
                              height: 1.3.h,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          // Search bar
                          Container(
                            height: 48,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.search, color: Colors.grey),
                                SizedBox(width: 8.w),
                                const Text(
                                  'Search here...',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.r),
                          topRight: Radius.circular(40.r),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
                      child: Center(
                        child: Text(
                          "How to get started ?",
                          style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Grid of products
          GriditemWidget(items: products),
        ],
      ),
    );
  }
}
