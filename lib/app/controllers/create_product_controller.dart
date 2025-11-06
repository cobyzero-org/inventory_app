import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:inventory_app/domain/models/category_model.dart';
import 'package:inventory_app/domain/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateProductController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final supabase = Supabase.instance.client;
  final categories = <CategoryModel>[].obs;
  final selectedCategory = "".obs;

  @override
  void onInit() async {
    super.onInit();
    await getCategories();
  }

  Future<void> getCategories() async {
    try {
      final response = await supabase.from("categories").select();
      categories.value = response
          .map((e) => CategoryModel.fromJson(e))
          .toList();
      if (categories.isNotEmpty) {
        selectedCategory.value = categories.first.name;
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Palette.redOpacity,
        colorText: Palette.red,
      );
    }
  }

  Future<void> createProduct() async {
    if (nameController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        stockController.text.isEmpty ||
        priceController.text.isEmpty ||
        selectedCategory.value.isEmpty) {
      Get.snackbar(
        "Error",
        "All fields are required",
        backgroundColor: Palette.redOpacity,
        colorText: Palette.red,
      );
      return;
    }
    try {
      final product = ProductModel(
        name: nameController.text,
        description: descriptionController.text,
        stock: int.parse(stockController.text),
        unitPrice: double.parse(priceController.text),
        categoryId: categories
            .firstWhere((e) => e.name == selectedCategory.value)
            .id,
        id: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      await supabase.from("products").insert(product.toJson());
      Get.snackbar(
        "Success",
        "Product created successfully",
        backgroundColor: Palette.greenOpacity,
        colorText: Palette.green,
      );
      resetForm();
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Palette.redOpacity,
        colorText: Palette.red,
      );
    }
  }

  void resetForm() {
    nameController.clear();
    descriptionController.clear();
    stockController.clear();
    priceController.clear();
    selectedCategory.value = categories.first.name;
  }
}
