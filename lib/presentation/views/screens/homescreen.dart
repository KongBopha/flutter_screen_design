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
        name: "Men Casual Hoodie – Dark Grey",
        price: 65,
        discountedPrice: 52,
        discountPercent: 20,
        soldCount: 320,
        availableStock: 180,
        code: 234567,
        description:
            "Comfortable casual hoodie made from soft cotton fabric. Suitable for daily wear, lightweight, warm, and breathable.",
        images: [
          "https://www.closurelondon.com/cdn/shop/files/CLSR3986_0014_CLS-ECOMBLAKE-22AUG4117.jpg?v=1756299639",
          "https://i5.walmartimages.com/seo/Pullover-Plain-Hoodie-for-Men-Casual-Front-Pocket-Long-Sleeve-Cotton-Fleece-Hooded-Sweatshirts-Drawstring-Tops-Large-Light-Blue_4610b52e-6e16-45c4-9380-467f21fa0d95.f2d165170b9ba411ecf3ed71920c01a6.jpeg?odnHeight=768&odnWidth=768&odnBg=FFFFFF",
        ],
      ),

      ProductDetailsModel(
        name: "Women Sport Jacket – Pink",
        price: 120,
        discountedPrice: 96,
        discountPercent: 20,
        soldCount: 210,
        availableStock: 140,
        code: 345678,
        description:
            "Stylish sports jacket designed for outdoor activities. Windproof, water-resistant, and flexible for movement.",
        images: [
          "https://cdnp.sanmar.com/medias/sys_master/images/ha8/h6c/28844316655646/1200W_3332_TRedWhite-0-LST90TRedWhiteModelFront2/1200W-3332-TRedWhite-0-LST90TRedWhiteModelFront2.jpg",
          "https://images.meesho.com/images/products/430359815/bgb9r_512.webp?width=512",
        ],
      ),

      ProductDetailsModel(
        name: "Unisex Running Windbreaker",
        price: 85,
        discountedPrice: 68,
        discountPercent: 20,
        soldCount: 500,
        availableStock: 300,
        code: 456789,
        description:
            "Ultra-light windbreaker perfect for running and hiking. Breathable fabric with sweat-wicking technology.",
        images: [
          "https://contents.mediadecathlon.com/p2709158/04bcca60e0d6588d565980fbd495371d/p2709158.jpg",
          "https://www.errea.com/media/catalog/product/F/J/FJ0K0Z00120_1.jpg",
        ],
      ),

      ProductDetailsModel(
        name: "Classic Denim Jacket – Blue",
        price: 150,
        discountedPrice: 120,
        discountPercent: 20,
        soldCount: 95,
        availableStock: 60,
        code: 567890,
        description:
            "Classic denim jacket with a timeless design. Durable material, comfortable fit, suitable for all seasons.",
        images: [
          "https://abicus.com.au/cdn/shop/files/Rolla_s-DirtCheapArtDenimJacket-LightBlue-5_550x.jpg?v=1742280371",
          "https://media-assets.grailed.com/prd/listing/temp/e4cbec954e7f4409a9308e38182b335d",
        ],
      ),

      ProductDetailsModel(
        name: "Men Outdoor Jacket – Olive Green",
        price: 180,
        discountedPrice: 135,
        discountPercent: 25,
        soldCount: 260,
        availableStock: 110,
        code: 678901,
        description:
            "Designed for outdoor adventures. Waterproof, wind-resistant, and insulated for cold weather conditions.",
        images: [
          "https://m.media-amazon.com/images/I/518pmtrp3nL._AC_UY1000_.jpg",
          "https://www.dopesnow.com/images/H0511_02_c7Mpjxj.jpg?w=375",
        ],
      ),
      ProductDetailsModel(
        name: "Men Outdoor Jacket – Olive Green",
        price: 180,
        discountedPrice: 135,
        discountPercent: 25,
        soldCount: 260,
        availableStock: 110,
        code: 678901,
        description:
            "Designed for outdoor adventures. Waterproof, wind-resistant, and insulated for cold weather conditions.",
        images: [
          "https://m.media-amazon.com/images/I/518pmtrp3nL._AC_UY1000_.jpg",
          "https://www.dopesnow.com/images/H0511_02_c7Mpjxj.jpg?w=375",
        ],
      ),

    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.redAccent,
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
                      padding: const EdgeInsets.fromLTRB(16, 35, 16, 16),
                      child: Center(
                        child: Text(
                          "How to get started ?",
                          style: TextStyle(
                            color: Colors.redAccent,
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
