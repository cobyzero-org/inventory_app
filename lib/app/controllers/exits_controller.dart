import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:inventory_app/domain/models/client_model.dart';
import 'package:inventory_app/domain/models/exit_model.dart';
import 'package:inventory_app/domain/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExitsController extends GetxController {
  final exits = <ExitModel>[].obs;
  final supabase = Supabase.instance.client;
  final searchController = TextEditingController();
  final debounce = Debouncer(delay: const Duration(seconds: 1));
  @override
  void onInit() {
    super.onInit();
    fetchExits();
    searchController.addListener(() {
      debounce.call(() {
        if (searchController.text.isNotEmpty) {
          searchExits(searchController.text);
        } else {
          fetchExits();
        }
      });
    });
  }

  Future<void> fetchExits() async {
    try {
      exits.clear();
      final response = await supabase.from('exits').select('*');
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
        final exit = ExitModel.fromJson(
          element,
          product: ProductModel.fromJson(product),
          client: ClientModel.fromJson(client),
        );
        exits.add(exit);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> searchExits(String query) async {
    try {
      final response = await supabase
          .from('exits')
          .select('*')
          .ilike('name', query);
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
        final exit = ExitModel.fromJson(
          element,
          product: ProductModel.fromJson(product),
          client: ClientModel.fromJson(client),
        );
        exits.add(exit);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
