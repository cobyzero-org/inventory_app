import 'package:get/get.dart';
import 'package:inventory_app/app/bindings/login_binding.dart';
import 'package:inventory_app/ui/screens/login_screen.dart';
import 'package:inventory_app/ui/screens/navigator_screen.dart';
import 'package:inventory_app/ui/screens/splash_screen.dart';

final router = <GetPage>[
  GetPage(name: '/splash', page: () => const SplashScreen()),
  GetPage(
    name: '/login',
    page: () => const LoginScreen(),
    binding: LoginBinding(),
  ),
  GetPage(name: '/navigator', page: () => NavigatorScreen()),
];
