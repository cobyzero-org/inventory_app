import 'package:get/get.dart';
import 'package:inventory_app/app/controllers/add_entry_controller.dart';
import 'package:inventory_app/app/controllers/add_exit_controller.dart';
import 'package:inventory_app/app/controllers/add_product_controller.dart';
import 'package:inventory_app/app/controllers/entry_controller.dart';
import 'package:inventory_app/app/controllers/exits_controller.dart';
import 'package:inventory_app/app/controllers/home_controller.dart';
import 'package:inventory_app/app/controllers/login_controller.dart';
import 'package:inventory_app/app/controllers/navigator_controller.dart';
import 'package:inventory_app/app/controllers/products_controller.dart';
import 'package:inventory_app/app/controllers/reports_controller.dart';
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

class AddProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddProductController());
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

class AddExitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddExitController());
  }
}

class EntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EntryController());
  }
}

class ReportsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportsController());
  }
}

class AddEntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddEntryController());
  }
}
