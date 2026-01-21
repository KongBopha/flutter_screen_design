import 'package:flutter/material.dart';
import 'package:flutter_testing/domain/models/variantmodel.dart';
import 'package:flutter_testing/presentation/views/screens/successful_screen.dart';
import 'package:flutter_testing/presentation/views/widgets/variantcard_widget.dart';

class MultiplevariationScreen extends StatefulWidget {
  const MultiplevariationScreen({super.key});

  @override
  State<MultiplevariationScreen> createState() =>
      _MultiplevariationScreenState();
}

class _MultiplevariationScreenState extends State<MultiplevariationScreen> {
  final List<VariationModel> variations = [VariationModel()];

  void addVariation() {
    setState(() {
      variations.add(VariationModel());
    });
  }

  void removeVariation(int index) {
    variations[index].dispose();
    setState(() {
      variations.removeAt(index);
    });
  }

  @override
  void dispose() {
    for (final v in variations) {
      v.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        title: const Text("Create Variation"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text("Total: ${variations.length}"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ...List.generate(
              variations.length,
              (index) => VariationCard(
                index: index,
                model: variations[index],
                onRemove: () => removeVariation(index),
              ),
            ),

            /// Add more
            OutlinedButton(
              onPressed: addVariation,
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                "Add variations",
                style: TextStyle(color: Colors.black),
              ),
            ),

            const SizedBox(height: 16),

            /// Create
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const SuccessfulScreen(),
                ),
              );
 
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text(
                "Create",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
