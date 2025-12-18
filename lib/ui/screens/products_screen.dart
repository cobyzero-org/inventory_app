import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:inventory_app/app/controllers/products_controller.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:inventory_app/ui/widgets/app_appbar.dart';
import 'package:inventory_app/ui/widgets/app_input.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';
import 'package:inventory_app/ui/widgets/product_item.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class ProductsScreen extends GetView<ProductsController> {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: "Listado de productos",
        subtitle: "Administra de manera eficiente",
        icon: Icon(Ionicons.cube_outline, color: Colors.black),
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.fetchProducts(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Constants.padding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 2.h),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Palette.white,
                    borderRadius: BorderRadius.circular(Constants.radius),
                    border: Border.all(color: Palette.border),
                  ),
                  child: AppInput(
                    controller: controller.searchController,
                    hintText: "Buscar producto",
                    prefixIcon: Icon(Ionicons.search),
                  ),
                ),
                Obx(() {
                  return AppText.regular(
                    text: "${controller.products.length} Productos Listados",
                    fontSize: 14,
                  );
                }),
                SizedBox(height: 2.h),
                Obx(() {
                  if (controller.products.isEmpty) {
                    return Center(
                      child: AppText.regular(
                        text: "No hay productos",
                        fontSize: 14,
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return ProductItem(product: controller.products[index]);
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
