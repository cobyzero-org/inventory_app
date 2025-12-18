import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_app/domain/models/client_model.dart';
import 'package:inventory_app/domain/models/entry_model.dart';
import 'package:inventory_app/domain/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EntryController extends GetxController {
  final searchController = TextEditingController();
  final entries = <EntryModel>[].obs;
  final supabase = Supabase.instance.client;
  @override
  void onInit() {
    super.onInit();
    fetchEntries();
  }

  Future<void> fetchEntries() async {
    try {
      entries.clear();
      final response = await supabase.from("entries").select("*");
      for (var element in response) {
        final product = await supabase
            .from('products')
            .select('*')
            .eq('id', element['product_id'])
            .single();
        final client = await supabase
            .from('clients')
            .select('*')
            .eq('id', element['client_id'])
            .single();
        final exit = EntryModel.fromJson(
          element,
          ProductModel.fromJson(product),
          ClientModel.fromJson(client),
        );
        entries.add(exit);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
