import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_app/app/controllers/exits_controller.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/ui/widgets/app_appbar.dart';
import 'package:inventory_app/ui/widgets/app_input.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';
import 'package:inventory_app/ui/widgets/exit_item.dart';
import 'package:sizer/sizer.dart';

class ExitsScreen extends GetView<ExitsController> {
  const ExitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppAppbar(
        showBackButton: true,
        title: "Listado de salidas",
        subtitle: "Administra de manera eficiente",
        icon: Icon(Icons.moving),
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.fetchExits(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Constants.padding),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
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
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                Obx(() {
                  return AppText.regular(
                    text: "${controller.exits.length} Salidas Listadas",
                    fontSize: 14,
                  );
                }),
                SizedBox(height: 2.h),
                Obx(() {
                  if (controller.exits.isEmpty) {
                    return Center(
                      child: AppText.regular(
                        text: "No hay salidas",
                        fontSize: 14,
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.exits.length,
                    itemBuilder: (context, index) {
                      return ExitItem(exit: controller.exits[index]);
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
