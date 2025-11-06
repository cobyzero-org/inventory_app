import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:inventory_app/app/controllers/home_controller.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sizer/sizer.dart';

class HomeDatesHistorics extends GetView<HomeController> {
  const HomeDatesHistorics({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Constants.padding,
        vertical: 2.h,
      ),
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(Constants.radius),
        border: Border.all(color: Palette.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.bold(text: "Datos históricos", fontSize: 16),
          SizedBox(height: 3.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Obx(
                      () => AppText.bold(
                        text: "${controller.produtsCounter.value}",
                        fontSize: 20,
                        color: Palette.chart1,
                      ),
                    ),
                    AppText.regular(text: "Total productos", fontSize: 14),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Obx(
                      () => AppText.bold(
                        text: "${controller.entriesCounter.value}",
                        fontSize: 20,
                        color: Palette.chart2,
                      ),
                    ),
                    AppText.regular(text: "Entradas", fontSize: 14),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Obx(
                      () => AppText.bold(
                        text: "${controller.exitsCounter.value}",
                        fontSize: 20,
                        color: Palette.chart3,
                      ),
                    ),
                    AppText.regular(text: "Salidas", fontSize: 14),
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
