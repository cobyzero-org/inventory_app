import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_app/app/controllers/add_product_controller.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/ui/widgets/app_appbar.dart';
import 'package:inventory_app/ui/widgets/app_button.dart';
import 'package:inventory_app/ui/widgets/app_dropdown.dart';
import 'package:inventory_app/ui/widgets/app_input.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class AddProductScreen extends GetView<AddProductController> {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: "Añadir un producto",
        icon: const Icon(Ionicons.add_outline, color: Colors.black),
        subtitle: "Agregar un nuevo producto al inventario",
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
                        text: "Información del producto",
                        fontSize: 16,
                      ),
                      SizedBox(height: 2.h),
                      AppInput(
                        controller: controller.nameController,
                        label: "Nombre",
                        hintText: "Nombre del producto",
                      ),
                      SizedBox(height: 2.h),
                      AppInput(
                        controller: controller.descriptionController,
                        label: "Descripción",
                        hintText: "Descripción del producto",
                      ),
                    ],
                  ),
                ),
              ),
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
                        text: "Datos esenciales del producto",
                        fontSize: 16,
                      ),
                      SizedBox(height: 2.h),
                      Obx(() {
                        return AppDropdown(
                          label: "Categoria",
                          items: controller.categories
                              .map((e) => e.name)
                              .toList(),
                          onChanged: (value) {
                            controller.selectedCategory.value = value!;
                          },
                          value: controller.selectedCategory.value,
                        );
                      }),
                      SizedBox(height: 2.h),
                      AppInput(
                        controller: controller.stockController,
                        label: "Stock",
                        hintText: "Stock del producto",
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 2.h),
                      AppInput(
                        controller: controller.priceController,
                        label: "Precio unitario",
                        hintText: "Precio unitario del producto",
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              AppButton(
                onPressed: () => controller.createProduct(),
                label: "Agregar producto",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
