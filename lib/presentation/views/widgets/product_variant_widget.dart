import 'package:flutter/material.dart';
import 'package:flutter_testing/domain/models/product_details_model.dart';
import 'package:flutter_testing/presentation/views/widgets/variant_widget.dart';

class ProductVariantWidget extends StatefulWidget {
  final ProductDetailsModel product;

  const ProductVariantWidget({super.key, required this.product});

  @override
  State<ProductVariantWidget> createState() => _ProductVariantWidgetState();
}

class _ProductVariantWidgetState extends State<ProductVariantWidget> {
  late List<bool> toggledList;

  @override
  void initState() {
    super.initState();
    toggledList = List.generate(widget.product.variants.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.product.variants.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return VariantCardWidget(
          imageUrl: widget.product.images[0],
          name: widget.product.name,
          price: widget.product.price,
          soldCount: widget.product.soldCount,
          availableStock: widget.product.availableStock,
          variant: widget.product.variants[index],
          isToggled: toggledList[index],
          onToggle: (value) {
            setState(() {
              toggledList[index] = value;
            });
          },
        );
      },
    );
  }
}
