import 'package:get/get.dart';
import 'package:inventory_app/app/controllers/create_product_controller.dart';
import 'package:inventory_app/app/controllers/exits_controller.dart';
import 'package:inventory_app/app/controllers/home_controller.dart';
import 'package:inventory_app/app/controllers/login_controller.dart';
import 'package:inventory_app/app/controllers/navigator_controller.dart';
import 'package:inventory_app/app/controllers/products_controller.dart';
import 'package:inventory_app/app/controllers/scanner_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductsController());
  }
}

class CreateProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateProductController());
  }
}

class ScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScannerController());
  }
}

class NavigatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigatorController());
  }
}

class ExitsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExitsController());
  }
}
