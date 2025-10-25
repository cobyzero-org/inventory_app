import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    // Lógica de validación simple (¡NO USAR EN PRODUCCIÓN!)
    if (email == 'test@example.com' && password == 'password123') {
      // Éxito en el login: podrías navegar a otra pantalla
      print('Login exitoso para: $email');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login Exitoso!')));
      Get.toNamed("/home");
    } else {
      // Fallo en el login
      print('Credenciales inválidas para: $email');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Credenciales Inválidas')));
    }
  }
}
