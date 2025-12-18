import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_app/domain/models/exit_model.dart';
import 'package:inventory_app/domain/models/client_model.dart';
import 'package:inventory_app/domain/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddExitController extends GetxController {
  final products = <ProductModel>[].obs;
  final clients = <ClientModel>[].obs;
  final supabase = Supabase.instance.client;
  final cantController = TextEditingController();
  final selectedProduct = Rxn<String>();
  final selectedClient = Rxn<String>();
  @override
  void onInit() {
    super.onInit();
    getProducts();
    getClients();
  }

  Future<void> getProducts() async {
    try {
      final args = Get.arguments;

      final response = await supabase.from("products").select();
      products.value = response.map((e) => ProductModel.fromJson(e)).toList();
      if (args != null) {
        selectedProduct.value = products
            .firstWhere((e) => e.id == (int.tryParse(args) ?? 0))
            .name;
      } else {
        selectedProduct.value = products.first.name;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> getClients() async {
    try {
      final response = await supabase.from("clients").select();
      clients.value = response.map((e) => ClientModel.fromJson(e)).toList();
      selectedClient.value = clients.first.name;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> createExit() async {
    try {
      final product = products.firstWhere(
        (e) => e.name == selectedProduct.value,
      );
      final client = clients.firstWhere((e) => e.name == selectedClient.value);
      final user = supabase.auth.currentUser;
      final userId = await supabase
          .from("users")
          .select("id")
          .eq("user_id", user!.id)
          .single();
      if (product.stock < int.parse(cantController.text)) {
        Get.snackbar("Error", "No hay stock suficiente");
        return;
      }
      final exit = ExitModel(
        id: 0,
        productId: product.id,
        clientId: client.id,
        userId: userId['id'],
        quantity: int.parse(cantController.text),
        date: DateTime.now(),
      );
      await supabase.from("exits").insert([exit.toJson()]);
      Get.back();
      Get.snackbar("Exito", "Salida agregada exitosamente");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
