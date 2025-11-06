import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:inventory_app/app/controllers/navigator_controller.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:inventory_app/ui/screens/create_product_screen.dart';
import 'package:inventory_app/ui/screens/home_screen.dart';
import 'package:inventory_app/ui/screens/products_screen.dart';
import 'package:inventory_app/ui/screens/scanner_screen.dart';
import 'package:inventory_app/ui/widgets/navigator_item.dart';
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
              NavigatorItem(
                icon: Icons.home,
                title: "Home",
                isSelected: controller.currentIndex.value == 0,
                onTap: () {
                  controller.pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              NavigatorItem(
                icon: Icons.list,
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
              NavigatorItem(
                icon: Icons.add,
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
              NavigatorItem(
                icon: Icons.qr_code,
                title: "Scanner",
                isSelected: controller.currentIndex.value == 3,
                onTap: () {
                  controller.pageController.animateToPage(
                    3,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
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
          children: [
            Obx(
              () => HomeScreen(
                pageController: controller.pageController,
                user: controller.user.value,
              ),
            ),
            ProductsScreen(),
            CreateProductScreen(),
            ScannerScreen(),
          ],
        ),
      ),
    );
  }
}
