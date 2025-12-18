import 'package:get/get.dart';
import 'package:inventory_app/app/bindings/bindings.dart';
import 'package:inventory_app/ui/screens/add_entry_screen.dart';
import 'package:inventory_app/ui/screens/add_exit_screen.dart';
import 'package:inventory_app/ui/screens/entry_screen.dart';
import 'package:inventory_app/ui/screens/exits_screen.dart';
import 'package:inventory_app/ui/screens/login_screen.dart';
import 'package:inventory_app/ui/screens/navigator_screen.dart';
import 'package:inventory_app/ui/screens/reports_screen.dart';
import 'package:inventory_app/ui/screens/splash_screen.dart';

final router = <GetPage>[
  GetPage(name: '/splash', page: () => const SplashScreen()),
  GetPage(
    name: '/login',
    page: () => const LoginScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: '/navigator',
    page: () => NavigatorScreen(),
    bindings: [
      ProductsBinding(),
      AddProductBinding(),
      ScannerBinding(),
      HomeBinding(),
      NavigatorBinding(),
    ],
  ),
  GetPage(
    name: '/exits',
    page: () => const ExitsScreen(),
    binding: ExitsBinding(),
  ),
  GetPage(
    name: '/add_exit',
    page: () => const AddExitScreen(),
    binding: AddExitBinding(),
  ),
  GetPage(
    name: '/entries',
    page: () => const EntryScreen(),
    binding: EntryBinding(),
  ),
  GetPage(
    name: '/reports',
    page: () => const ReportsScreen(),
    binding: ReportsBinding(),
  ),
  GetPage(
    name: '/add_entry',
    page: () => const AddEntryScreen(),
    binding: AddEntryBinding(),
  ),
];
