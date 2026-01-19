import 'package:flutter/material.dart';

class VariationModel {
  final TextEditingController nameController;
  final TextEditingController skuController;
  final TextEditingController priceController;
  final TextEditingController stockController;

  VariationModel()
      : nameController = TextEditingController(),
        skuController = TextEditingController(),
        priceController = TextEditingController(),
        stockController = TextEditingController();

  void dispose() {
    nameController.dispose();
    skuController.dispose();
    priceController.dispose();
    stockController.dispose();
  }
}
