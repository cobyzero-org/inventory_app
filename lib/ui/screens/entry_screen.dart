import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_app/app/controllers/entry_controller.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/ui/widgets/app_appbar.dart';
import 'package:inventory_app/ui/widgets/app_button.dart';
import 'package:inventory_app/ui/widgets/app_input.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';
import 'package:inventory_app/ui/widgets/entry_item.dart';
import 'package:sizer/sizer.dart';

class EntryScreen extends GetView<EntryController> {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        showBackButton: true,
        title: "Listado de entradas",
        subtitle: "Administra de manera eficiente",
        icon: Icon(Icons.moving, color: Colors.black),
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.fetchEntries(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Constants.padding),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.h),
                AppButton(
                  onPressed: () => Get.toNamed('/add_entry'),
                  label: "Agregar entrada",
                ),
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
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                Obx(() {
                  return AppText.regular(
                    text: "${controller.entries.length} Entradas Listadas",
                    fontSize: 14,
                  );
                }),
                SizedBox(height: 2.h),
                Obx(() {
                  if (controller.entries.isEmpty) {
                    return Center(
                      child: AppText.regular(
                        text: "No hay entradas",
                        fontSize: 14,
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.entries.length,
                    itemBuilder: (context, index) {
                      return EntryItem(entry: controller.entries[index]);
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
