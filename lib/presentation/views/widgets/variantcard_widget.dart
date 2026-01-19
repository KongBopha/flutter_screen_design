import 'package:flutter/material.dart';
import 'package:flutter_testing/domain/models/variantmodel.dart';
import 'package:flutter_testing/presentation/views/widgets/fieldtitle_widget.dart';
import 'package:flutter_testing/presentation/views/widgets/shadowtextfield_widget.dart';
import 'package:flutter_testing/presentation/views/widgets/uploadimage_widget.dart';

class VariationCard extends StatelessWidget {
  final int index;
  final VariationModel model;
  final VoidCallback onRemove;

  const VariationCard({
    super.key,
    required this.index,
    required this.model,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Variation ${index + 1}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (index > 0)
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: onRemove,
                ),
            ],
          ),

          const SizedBox(height: 16),

          UploadimageWidget(),
          const SizedBox(height: 24),

          const FieldTitle("Variation name (Required)"),
          ShadowTextField(
            controller: model.nameController,
            hintText: "Jacket air-front",
          ),

          const SizedBox(height: 16),

          const FieldTitle("SKU / Item code (Required)"),
          ShadowTextField(
            controller: model.skuController,
            hintText: "11227788",
          ),

          const SizedBox(height: 16),

          const FieldTitle("Sale price (Required)"),
          ShadowTextField(
            controller: model.priceController,
            hintText: "\$ 9.75",
          ),

          const SizedBox(height: 16),

          const FieldTitle("Stock (Required)"),
          ShadowTextField(
            controller: model.stockController,
            hintText: "99",
          ),
        ],
      ),
    );
  }
}
