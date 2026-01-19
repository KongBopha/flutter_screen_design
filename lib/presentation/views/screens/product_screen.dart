import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_testing/core/utils/category_enum.dart';
import 'package:flutter_testing/core/utils/gender_enum.dart';
import 'package:flutter_testing/presentation/views/screens/createvariant%20_screen.dart';
import 'package:flutter_testing/presentation/views/widgets/dialog_widget.dart';
import 'package:flutter_testing/presentation/views/widgets/dropdown_widget.dart';
import 'package:flutter_testing/presentation/views/widgets/fieldtitle_widget.dart';
import 'package:flutter_testing/presentation/views/widgets/shadowtextfield_widget.dart';
import 'package:flutter_testing/presentation/views/widgets/uploadimage_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key}
  );

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final productController = TextEditingController();
  final slugController = TextEditingController();

  Gender? selectedGender;
  ClothingCategory? selectedCategory;

  @override
  void dispose() {
    productController.dispose();
    slugController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Create Product"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Product Image",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 14.h),
            const UploadimageWidget(),

            SizedBox(height: 16.h),
            Text(
              "Product Details",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.h),
            const FieldTitle("Product name (Required)"),
            ShadowTextField(
              controller: productController,
              hintText: "Enter Product name",
            ),
            SizedBox(height: 10.h),
            ShadowTextField(
              controller: slugController,
              hintText: "Slug",
            ),
            SizedBox(height: 16.h),

            const FieldTitle("Gender (Required)"),
            SizedBox(height: 12.h),

            ///  GENDER DROPDOWN
            DropdownWidget<Gender>(
              labelText: "Select Gender",
              selectedItem: selectedGender,
              items: genderMap.values.toList(),
              onChanged: (Gender? value) {
                setState(() {
                  selectedGender = value;
                });
              },
              itemLabelBuilder: (gender) =>
                  genderMap.entries
                      .firstWhere((e) => e.value == gender)
                      .key,
            ),

            SizedBox(height: 16.h),

            ///  CATEGORY DROPDOWN
            DropdownWidget<ClothingCategory>(
              labelText: "Select Category",
              selectedItem: selectedCategory,
              items: clothingCategoryMap.values.toList(),
              onChanged: (ClothingCategory? value) {
                setState(() {
                  selectedCategory = value;
                });
              },
              itemLabelBuilder: (category) =>
                  clothingCategoryMap.entries
                      .firstWhere((e) => e.value == category)
                      .key,
            ),
            SizedBox(height: 16.h),
            Text(
              "Product Details",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.h),
            DottedBorder(
            options:  RoundedRectDottedBorderOptions(
                radius: Radius.circular(20),
                color: Colors.black,  
                strokeWidth: 1,     
                dashPattern: [3, 5],  
             ),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child:TextButton(
              onPressed: (){},
              child: const Text("Editable",style: TextStyle(color: Colors.black),),
            ),
            ),
          ),
          SizedBox(height: 16.h),

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
              onPressed: () async {
                return showDialog (
                  context: context,
                   builder: (context) => const VariationDialog(),
                );

                // if (result == "multiple") {
                //    Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //       builder: (_) => const CreateVariantScreen(),
                //     ),
                //   );
                // }
                // if (result == "single") {
                //   Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //       builder: (_) => const CreateVariantScreen(),
                //     ),
                //   );
                // }
              },
              child: Text(
                'Create Variantion',
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
        ),
     ),
    );
  }
}
