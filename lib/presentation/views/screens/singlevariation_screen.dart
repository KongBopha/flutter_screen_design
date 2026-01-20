import 'package:flutter/material.dart';
import 'package:flutter_testing/presentation/views/widgets/fieldtitle_widget.dart';
import 'package:flutter_testing/presentation/views/widgets/shadowtextfield_widget.dart';
import 'package:flutter_testing/presentation/views/widgets/uploadimage_widget.dart';

class SinglevariationScreen extends StatefulWidget {
  const SinglevariationScreen({super.key});

  @override
  State<SinglevariationScreen> createState() => _SinglevariationScreenState();
}

class _SinglevariationScreenState extends State<SinglevariationScreen> {
  final variationNameController = TextEditingController();
  final skuController = TextEditingController();
  final priceController = TextEditingController();
  final stockController = TextEditingController();

  @override
  void dispose() {
    variationNameController.dispose();
    skuController.dispose();
    priceController.dispose();
    stockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          "Create Variation",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                "Step 2 / 3",
                style: TextStyle(fontSize: 14),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Note
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "Note*:",style: TextStyle(color: Colors.red,)),
                  TextSpan(text: 
                  "\tOne product must have at least one of its product’s variants.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
                ]
            ),),
            const SizedBox(height: 16),

            // Product Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // product image
                  const UploadimageWidget(),
                  const SizedBox(height: 24),
                  // Variation name
                  const FieldTitle("Variation name (Required)"),
                  ShadowTextField(
                    controller: variationNameController,
                    hintText: "Jacket air-front",
                  ),

                  const SizedBox(height: 16),

                  // SKU
                  const FieldTitle("SKU / Item code (Required)"),
                  ShadowTextField(
                    controller: skuController,
                    hintText: "11227788",
                  ),

                  const SizedBox(height: 16),

                  // Sale price
                  const FieldTitle("Sale price (Required)"),
                  ShadowTextField(
                    controller: priceController,
                    hintText: "\$ 9.75",
                  ),

                  const SizedBox(height: 16),

                  // Stock
                  const FieldTitle("Stock (Required)"),
                  ShadowTextField(
                    controller: stockController,
                    hintText: "99",
                  ),
                  const SizedBox(height: 16),

                  const FieldTitle("Discount"),
                  ShadowTextField(
                    controller: stockController,
                    hintText: "40",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Add variations
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text("Add variations",style: TextStyle(color: Colors.black),),
            ),

            const SizedBox(height: 16),

            // Create button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                "Create",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
