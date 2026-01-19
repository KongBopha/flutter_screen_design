import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_testing/domain/models/product_details_model.dart';
import 'package:flutter_testing/domain/models/productvariants_model.dart';
import 'package:flutter_testing/presentation/views/screens/createvariantscreen.dart';
import 'package:flutter_testing/presentation/views/screens/variant_product_screen.dart';
import 'package:flutter_testing/presentation/views/widgets/product_details_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductDetailsModel product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late TabController _tabController;
      final List <ProductDetailsModel> products =[
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
          "https://i5.walmartimages.com/seo/Pullover-Plain-Hoodie-for-Men-Casual-Front-Pocket-Long-Sleeve-Cotton-Fleece-Hooded-Sweatshirts-Drawstring-Tops-Large-Light-Blue_4610b52e-6e16-45c4-9380-467f21fa0d95.f2d165170b9ba411ecf3ed71920c01a6.jpeg?odnHeight=768&odnWidth=768&odnBg=FFFFFF",
         ],
        variants: [
          ProductVariantModel(color: "Dark Grey", size: "M"),
          ProductVariantModel(color: "Dark Grey", size: "L"),
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
         ],
        variants: [
          ProductVariantModel(color: "Dark Grey", size: "M"),
          ProductVariantModel(color: "Dark Grey", size: "L"),
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
         ],
        variants: [
          ProductVariantModel(color: "Dark Grey", size: "M"),
          ProductVariantModel(color: "Dark Grey", size: "L"),
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
         ],
        variants: [
          ProductVariantModel(color: "Dark Grey", size: "M"),
          ProductVariantModel(color: "Dark Grey", size: "L"),
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
         ],
        variants: [
          ProductVariantModel(color: "Dark Grey", size: "M"),
          ProductVariantModel(color: "Dark Grey", size: "L"),
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
        ],
        variants: [
          ProductVariantModel(color: "Dark Grey", size: "M"),
          ProductVariantModel(color: "Dark Grey", size: "L"),
        ],
      ),

    ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Product Details',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          dividerColor: Colors.transparent,
          indicator: const BoxDecoration(), // remove default underline
          labelPadding: EdgeInsets.symmetric(horizontal: 6.w),
          tabs: [
            _buildTab(title: 'Products', index: 0),
            _buildTab(title: 'Variants', index: 1),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [
          // ===== Products Tab =====
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Carousel
                      Stack(
                        children: [
                          CarouselSlider.builder(
                            itemCount: widget.product.images.length,
                            itemBuilder: (context, index, realIndex) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: Image.network(
                                  widget.product.images[index],
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                ),
                              );
                            },
                            options: CarouselOptions(
                              height: 300.h,
                              viewportFraction: 1.0,
                              enableInfiniteScroll: false,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 12,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '${_currentIndex + 1} / ${widget.product.images.length}',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      ProductDetailsWidget(model: widget.product),
                    ],
                  ),
                ),
              ),
              // Bottom button for Products tab
              Container(
                height: 80.h,
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[800],
                  ),
                  onPressed: () {},
                  child: Text(
                    'Edit Product',
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                ),
              ),
            ],
          ),

          // ===== Variants Tab =====
          Column(
            children: [
              Expanded(
                child: VariantProductScreen(products: products[0])
              ),
              // Bottom button for Variants tab
              Container(
                height: 80.h,
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[800],
                  ),
                  onPressed: () {},
                  child: Text(
                    'Do Something for Variants',
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTab({required String title, required int index}) {
    final bool isSelected = _tabController.index == index;

    return Tab(
      child: Container(
        height: 36.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.red[800] : Colors.white,
          borderRadius: BorderRadius.circular(32.r),
          border: Border.all(
            color: isSelected ? Colors.red[800]! : Colors.grey.shade400,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
