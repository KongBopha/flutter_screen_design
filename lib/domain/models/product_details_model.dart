import 'package:flutter/foundation.dart';
import 'package:flutter_testing/domain/models/productvariants_model.dart'; 
class ProductDetailsModel {
  final String name;
  final String description;
  final double price;
  final int code;
  List <String> images = [];
  List<ProductVariantModel> variants;
  final VoidCallback? onCounterChanged; 
  final double discountPercent;
  final double discountedPrice;
  final int soldCount;
  final int availableStock;
  ProductDetailsModel({
    required this.name,
    required this.description,
    required this.price,
    required this.code,
    this.images = const [],
    this.variants = const [],
    required this.discountPercent,
    required this.discountedPrice,
    required this.soldCount,
    required this.availableStock,
    this.onCounterChanged,
  });

}