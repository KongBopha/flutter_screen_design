import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_testing/presentation/views/widgets/fieldtitle_widget.dart';
import 'package:flutter_testing/presentation/views/widgets/shadowtextfield_widget.dart';

class VariaintOptionWidget extends StatefulWidget {
  const VariaintOptionWidget({super.key});

  @override
  State<VariaintOptionWidget> createState() => _VariaintOptionWidgetState();
}

class _VariaintOptionWidgetState extends State<VariaintOptionWidget> {
  final optionController = TextEditingController();
  final valuesController = TextEditingController();
  bool isAdd = false;
  bool addMoreOption = false;
  
  @override
  void dispose() {
    optionController.dispose();
    valuesController.dispose();
    super.dispose();
  }
  void updateValue(){
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 280,
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
                  hintText: "Enter value",
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () {
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                    content: Text(optionController.text),
                  );
                });
                },
                child: const Text("Add"),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
              },
              child: const Text("Add more options"),
            ),
          ),
        ],
      ),
    );
  }
}
