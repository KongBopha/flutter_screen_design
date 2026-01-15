import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_testing/domain/models/product_details_model.dart';
import 'package:flutter_testing/presentation/views/widgets/product_details_widget.dart';

class ProductScrollableWidget extends StatefulWidget {
  final List<String> imageUrl;
  const ProductScrollableWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  State<ProductScrollableWidget> createState() =>
      _ProductScrollableWidgetState();
}

class _ProductScrollableWidgetState extends State<ProductScrollableWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(height: 20,),
        CarouselSlider.builder(
          itemCount: widget.imageUrl.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.imageUrl[index]),
                  fit: BoxFit.contain,
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 350,
            autoPlay: false,
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
          bottom: 0,
          left: 0,
          right: 0,
          child:
        ProductDetailsWidget(
              model: ProductDetailsModel(
                name: 'Black Jacket with a white logo air-front for man',
                price: 100.0,
                discountedPrice: 80.0,
                discountPercent: 20.0,
                soldCount: 150,
                availableStock: 250,
                code: 123456789,
                description: 'Product Description',
              )
        ),
        ),
        Positioned(
          bottom: 330,
          right: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha:0.1),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.white54,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
            ),
            child: Text(
              '${_currentIndex + 1} / ${widget.imageUrl.length}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],

    );

  }
}
