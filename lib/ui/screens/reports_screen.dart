import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:inventory_app/app/controllers/reports_controller.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/ui/widgets/circular_chart.dart';
import 'package:sizer/sizer.dart';

class ReportsScreen extends GetView<ReportsController> {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.generateStockPdf(),
        child: const Icon(Icons.download),
      ),
      appBar: AppBar(title: const Text('Reportes')),
      body: RefreshIndicator(
        onRefresh: controller.fetchData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Constants.padding,
              vertical: 2.h,
            ),
            child: Obx(() {
              if (controller.loading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              return Column(
                children: [
                  SizedBox(
                    height: 40.h,
                    width: double.infinity,
                    child: CircularChart(
                      products: controller.mostProductsStock,
                      title: "Productos con mayor stock",
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                    margin: EdgeInsets.symmetric(vertical: 3.h),
                  ),
                  SizedBox(
                    height: 40.h,
                    width: double.infinity,
                    child: CircularChart(
                      products: controller.mostEntriesProducts,
                      title: "Productos con mayores entradas",
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                    margin: EdgeInsets.symmetric(vertical: 3.h),
                  ),
                  SizedBox(
                    height: 40.h,
                    width: double.infinity,
                    child: CircularChart(
                      products: controller.mostExitsProducts,
                      title: "Productos con mayores salidas",
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
