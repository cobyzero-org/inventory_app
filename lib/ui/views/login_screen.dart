import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_app/app/controllers/login_controller.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/ui/widgets/app_button.dart';
import 'package:inventory_app/ui/widgets/app_input.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Constants.padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: AppText(
                text: "Hola Bienvenido!!!",
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 9.h),
            Image.asset(
              "assets/images/logo.png",
              height: 20.h,
              width: 20.h,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 9.h),
            AppInput(
              controller: controller.emailController,
              label: "Correo Electronico",
              keyboardType: TextInputType.emailAddress,
              hintText: "Ingresa tu correo",
            ),
            SizedBox(height: 3.h),
            AppInput(
              controller: controller.passwordController,
              label: "Contraseña",
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              hintText: "Ingresa tu contraseña",
            ),
            SizedBox(height: 4.h),
            AppButton(
              onPressed: () {
                controller.login(context);
              },
              label: "Inciar Sesion",
            ),
          ],
        ),
      ),
    );
  }
}
