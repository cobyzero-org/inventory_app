import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final supabase = Supabase.instance.client;
  void login(BuildContext context) async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Por favor, completa todos los campos");
      return;
    }

    try {
      final response = await supabase.auth.signInWithPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (response.session != null) {
        Get.offAllNamed("/navigator");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
