import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_app/app/controllers/scanner_controller.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/ui/widgets/app_appbar.dart';
import 'package:inventory_app/ui/widgets/app_button.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:sizer/sizer.dart';

class ScannerScreen extends GetView<ScannerController> {
  const ScannerScreen({super.key, required this.mobileScannerController});
  final MobileScannerController mobileScannerController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: "Escanea",
        icon: const Icon(Ionicons.barcode_outline, color: Colors.black),
        subtitle: "Escanea el codigo QR del producto",
      ),
      body: Column(
        children: [
          Expanded(
            child: MobileScanner(
              controller: mobileScannerController,
              onDetect: controller.scanBarcode,
              placeholderBuilder: (context) {
                return Center(
                  child: AppText.bold(
                    text: "Presiona el boton de iniciar para escanear",
                    fontSize: 16,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Constants.padding),
            child: AppButton(
              onPressed: () async {
                await mobileScannerController.start();
              },
              label: "Iniciar",
            ),
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Constants.padding),
            child: AppButton(
              onPressed: () async {
                await mobileScannerController.start();
                controller.scanBarcode(
                  BarcodeCapture(barcodes: [Barcode(displayValue: "22")]),
                );
              },
              label: "Simular escaneo",
            ),
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
