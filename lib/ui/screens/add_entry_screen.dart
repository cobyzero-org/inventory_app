import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_app/app/controllers/add_entry_controller.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/ui/widgets/app_appbar.dart';
import 'package:inventory_app/ui/widgets/app_button.dart';
import 'package:inventory_app/ui/widgets/app_dropdown.dart';
import 'package:inventory_app/ui/widgets/app_input.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class AddEntryScreen extends GetView<AddEntryController> {
  const AddEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: "Agregar entrada",
        icon: const Icon(Ionicons.add_outline, color: Colors.black),
        subtitle: "Agregar una nueva entrada al inventario",
        showBackButton: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.padding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 2.h),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 2.h,
                    horizontal: Constants.padding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.bold(
                        text: "Información de la entrada",
                        fontSize: 16,
                      ),
                      SizedBox(height: 2.h),
                      Obx(() {
                        return AppDropdown(
                          label: "Producto",
                          items: controller.products
                              .map((e) => e.name)
                              .toList(),
                          onChanged: (value) {
                            controller.selectedProduct.value = value!;
                          },
                          value: controller.selectedProduct.value,
                        );
                      }),
                      SizedBox(height: 2.h),
                      Obx(() {
                        if (controller.selectedProduct.value == null) {
                          return const SizedBox.shrink();
                        }
                        final product = controller.products.firstWhere(
                          (e) => e.name == controller.selectedProduct.value,
                        );
                        return AppText.regular(text: "Stock: ${product.stock}");
                      }),
                      SizedBox(height: 2.h),
                      Obx(() {
                        return AppDropdown(
                          label: "Cliente",
                          items: controller.clients.map((e) => e.name).toList(),
                          onChanged: (value) {
                            controller.selectedClient.value = value!;
                          },
                          value: controller.selectedClient.value,
                        );
                      }),
                      SizedBox(height: 2.h),
                      AppInput(
                        controller: controller.cantController,
                        label: "Cantidad de entrada",
                        hintText: "Cantidad",
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              AppButton(
                onPressed: () => controller.createEntry(),
                label: "Agregar entrada",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
