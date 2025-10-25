import 'package:get/get.dart';
import 'package:inventory_app/app/bindings/login_binding.dart';
import 'package:inventory_app/ui/views/home_screen.dart';
import 'package:inventory_app/ui/views/login_screen.dart';

final router = <GetPage>[
  GetPage(
    name: '/login',
    page: () => const LoginScreen(),
    binding: LoginBinding(),
  ),
  GetPage(name: '/home', page: () => HomeScreen()),
];
