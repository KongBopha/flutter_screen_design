import 'package:flutter/material.dart';
import 'package:flutter_testing/domain/models/product_details_model.dart';
import 'package:flutter_testing/presentation/views/widgets/product_variant_widget.dart';

class VariantProductScreen extends StatelessWidget {
  final ProductDetailsModel products;
  const VariantProductScreen({
    super.key,
    required this.products,
    });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:   [
          ProductVariantWidget(product: products)
        ],
      ),
    );
  }
}