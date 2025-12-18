import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerController extends GetxController {
  var result = "".obs;

  void scanBarcode(BarcodeCapture barcodeCapture) {
    result.value = barcodeCapture.barcodes.firstOrNull?.displayValue ?? "";
    Get.snackbar("Resultado", result.value);
    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text("Crear Salida"),
              onTap: () {
                Get.back();
                Get.toNamed("/add_exit", arguments: result.value);
              },
            ),
            ListTile(
              title: Text("Crear Entrada"),
              onTap: () {
                Get.back();
                Get.toNamed("/add_entry", arguments: result.value);
              },
            ),
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
    );
  }
}
