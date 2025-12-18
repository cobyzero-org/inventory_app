import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:inventory_app/app/controllers/home_controller.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sizer/sizer.dart';

class HomeDatesHistorics extends GetView<HomeController> {
  const HomeDatesHistorics({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Constants.padding,
        vertical: 2.h,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(Constants.radius),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Datos históricos", style: theme.textTheme.titleMedium),
          SizedBox(height: 3.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Obx(
                      () => Text(
                        "${controller.produtsCounter.value}",
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: Palette.chart1,
                        ),
                      ),
                    ),
                    Text("Total productos", style: theme.textTheme.bodyMedium),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Obx(
                      () => Text(
                        "${controller.entriesCounter.value}",
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: Palette.chart2,
                        ),
                      ),
                    ),
                    Text("Entradas", style: theme.textTheme.bodyMedium),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Obx(
                      () => Text(
                        "${controller.exitsCounter.value}",
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: Palette.chart3,
                        ),
                      ),
                    ),
                    Text("Salidas", style: theme.textTheme.bodyMedium),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
