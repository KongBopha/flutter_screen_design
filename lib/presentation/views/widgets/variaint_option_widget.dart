 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_testing/presentation/views/widgets/fieldtitle_widget.dart';
import 'package:flutter_testing/presentation/views/widgets/shadowtextfield_widget.dart';

class VariantOptionWidget extends StatefulWidget {
  const VariantOptionWidget({super.key});

  @override
  State<VariantOptionWidget> createState() => _VariantOptionWidgetState();
}

class _VariantOptionWidgetState extends State<VariantOptionWidget> {
  final optionController = TextEditingController();
  final valuesController = TextEditingController();

  final List<String> values = [];

  @override
  void dispose() {
    optionController.dispose();
    valuesController.dispose();
    super.dispose();
  }

  void addValue() {
    final text = valuesController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      values.add(text);
      valuesController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FieldTitle("Options (Required)"),
          ShadowTextField(
            controller: optionController,
            hintText: "Enter option",
          ),

          SizedBox(height: 16.h),

          const FieldTitle("Values (Required)"),
          Row(
            children: [
              Expanded(
                child: ShadowTextField(
                  controller: valuesController,
                  hintText: "Enter values",
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.red),
                ),
                onPressed: addValue,
                child: const Text("Add", style:   TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: values.isEmpty
                ? const Text(
                    "Values is empty",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  )
                : Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: values.map((value) {
                      return Chip(
                        label: Text(value),
                        deleteIcon: const Icon(Icons.close, size: 18),
                        onDeleted: () {
                          setState(() {
                            values.remove(value);
                          });
                        },
                      );
                    }).toList(),
                  ),
          ),
        ],
      ),
    );
  }
}
