import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_testing/presentation/views/screens/multiplevariation_screen.dart';
import 'package:flutter_testing/presentation/views/screens/singlevariation_screen.dart';
import 'package:flutter_testing/presentation/views/widgets/variaint_option_widget.dart';

class CreateVariantScreen extends StatefulWidget {
  const CreateVariantScreen({super.key});

  @override
  State<CreateVariantScreen> createState() => _CreateVariantScreenState();
}

class _CreateVariantScreenState extends State<CreateVariantScreen> {
  
  final List<int> optionList = [0];
  bool checkMoreOption = false ;
  void addMoreOption() {
    setState(() {
      optionList.add(optionList.length);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Create Option"),
      ),
      body:  SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ...optionList.map(
            (_) => const VariantOptionWidget(),
          ),

          const SizedBox(height: 16),
          DottedBorder(
            options:  RoundedRectDottedBorderOptions(
                radius: Radius.circular(20),
                color: Colors.blueGrey,  
                strokeWidth: 2,     
                dashPattern: [3, 5],  
             ),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child:TextButton(
              onPressed: addMoreOption,
              child: const Text("Add more option"),
            ),
            ),
          ),
        ],
      ),
    ),
    bottomNavigationBar:Container(
        height: 80.h,
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[800],),
            onPressed: () {
              if (optionList.length > 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MultiplevariationScreen(),
                  ),
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SinglevariationScreen(),
                  ),
                );
              }
            },
              child: Text(
                'Next',
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
        ),
     ),
    );
  }
}
