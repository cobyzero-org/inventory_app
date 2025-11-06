import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_app/app/controllers/scanner_controller.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/ui/widgets/app_appbar.dart';
import 'package:inventory_app/ui/widgets/app_button.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:sizer/sizer.dart';

class ScannerScreen extends GetView<ScannerController> {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: "Escanea",
        icon: const Icon(Icons.qr_code),
        subtitle: "Escanea el codigo QR del producto",
      ),
      body: Column(
        children: [
          Expanded(
            child: MobileScanner(
              controller: controller.controller,
              onDetect: (result) {
                controller.result.value = result.barcodes.first.rawValue ?? "";
              },
            ),
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Constants.padding),
            child: AppButton(
              onPressed: () {
                controller.scanBarcode();
              },
              label: "Confirmar",
            ),
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
