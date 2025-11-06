import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:inventory_app/domain/models/category_model.dart';
import 'package:inventory_app/domain/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductsController extends GetxController {
  final supabase = Supabase.instance.client;
  final products = <ProductModel>[].obs;
  final searchController = TextEditingController();
  final debounce = Debouncer(delay: const Duration(seconds: 1));
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    searchController.addListener(() {
      debounce.call(() {
        if (searchController.text.isNotEmpty) {
          searchProducts(searchController.text);
        } else {
          fetchProducts();
        }
      });
    });
  }

  Future<void> fetchProducts() async {
    try {
      final response = await supabase.from('products').select('*');
      for (var element in response) {
        final categoryResponse = await supabase
            .from('categories')
            .select('*')
            .eq('id', element['category_id']);
        final category = categoryResponse.isNotEmpty
            ? CategoryModel.fromJson(categoryResponse.first)
            : null;
        products.add(ProductModel.fromJson(element, category: category));
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> searchProducts(String query) async {
    try {
      final response = await supabase
          .from('products')
          .select('*')
          .ilike('name', '%$query%');
      products.clear();
      for (var element in response) {
        final categoryResponse = await supabase
            .from('categories')
            .select('*')
            .eq('id', element['category_id']);
        final category = categoryResponse.isNotEmpty
            ? CategoryModel.fromJson(categoryResponse.first)
            : null;
        products.add(ProductModel.fromJson(element, category: category));
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
