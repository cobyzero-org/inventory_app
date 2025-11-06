import 'dart:ui';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerController extends GetxController {
  final MobileScannerController controller = MobileScannerController(
    cameraResolution: const Size(1920, 1080),
    detectionSpeed: DetectionSpeed.normal,
    detectionTimeoutMs: 1000,
    formats: [BarcodeFormat.codabar],
    returnImage: true,
    torchEnabled: true,
    invertImage: false,
    autoZoom: true,
  );
  var result = "".obs;

  void scanBarcode() {
    if (result.value.isEmpty) {
      Get.snackbar(
        "Error",
        "No se detecto ningun codigo",
        backgroundColor: Palette.redOpacity,
        colorText: Palette.red,
      );
    }
  }
}
