import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:inventory_app/app/controllers/navigator_controller.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:inventory_app/ui/screens/add_product_screen.dart';
import 'package:inventory_app/ui/screens/home_screen.dart';
import 'package:inventory_app/ui/screens/products_screen.dart';
import 'package:inventory_app/ui/screens/scanner_screen.dart';
import 'package:inventory_app/ui/widgets/navigator_item.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class NavigatorScreen extends GetView<NavigatorController> {
  const NavigatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        decoration: BoxDecoration(
          color: Palette.background,
          border: Border(
            top: BorderSide(color: Palette.gray.withValues(alpha: 0.5)),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Obx(
                () => NavigatorItem(
                  icon: Ionicons.home_outline,
                  title: "Inicio",
                  isSelected: controller.currentIndex.value == 0,
                  onTap: () {
                    controller.pageController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
              Obx(
                () => NavigatorItem(
                  icon: Ionicons.cube_outline,
                  title: "Productos",
                  isSelected: controller.currentIndex.value == 1,
                  onTap: () {
                    controller.pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
              Obx(
                () => NavigatorItem(
                  icon: Ionicons.add_outline,
                  title: "Agregar",
                  isSelected: controller.currentIndex.value == 2,
                  onTap: () {
                    controller.pageController.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
              Obx(
                () => NavigatorItem(
                  icon: Ionicons.barcode_outline,
                  title: "Escaner",
                  isSelected: controller.currentIndex.value == 3,
                  onTap: () {
                    controller.pageController.animateToPage(
                      3,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Palette.background,
      body: SafeArea(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: (index) async {
            if (index != 3) {
              await controller.mobileScannerController.stop();
            }
          },
          children: [
            Obx(
              () => HomeScreen(
                pageController: controller.pageController,
                user: controller.user.value,
              ),
            ),
            ProductsScreen(),
            AddProductScreen(),
            ScannerScreen(
              mobileScannerController: controller.mobileScannerController,
            ),
          ],
        ),
      ),
    );
  }
}
