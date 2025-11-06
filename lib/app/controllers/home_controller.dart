import 'package:get/get.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  var produtsCounter = 0.obs;
  var entriesCounter = 0.obs;
  var exitsCounter = 0.obs;
  final supabase = Supabase.instance.client;
  @override
  void onInit() {
    super.onInit();
    getProductsCounter();
    getEntriesCounter();
    getExitsCounter();
  }

  void getProductsCounter() async {
    try {
      final response = await supabase.from("products").select("*");
      produtsCounter.value = response.length;
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Palette.redOpacity,
        colorText: Palette.red,
      );
    }
  }

  void getEntriesCounter() async {
    try {
      final response = await supabase.from("entries").select("*");
      entriesCounter.value = response.length;
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Palette.redOpacity,
        colorText: Palette.red,
      );
    }
  }

  void getExitsCounter() async {
    try {
      final response = await supabase.from("exits").select("*");
      exitsCounter.value = response.length;
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Palette.redOpacity,
        colorText: Palette.red,
      );
    }
  }

  void logout() async {
    try {
      await supabase.auth.signOut();
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Palette.redOpacity,
        colorText: Palette.red,
      );
    }
  }
}
