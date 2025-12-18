import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:inventory_app/domain/models/user_model.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NavigatorController extends GetxController {
  final supabase = Supabase.instance.client;
  Rxn<UserModel> user = Rxn<UserModel>();
  final PageController pageController = PageController();
  var currentIndex = 0.obs;
  final MobileScannerController mobileScannerController =
      MobileScannerController(
        autoStart: false,
        cameraResolution: const Size(1920, 1080),
        detectionSpeed: DetectionSpeed.normal,
        detectionTimeoutMs: 1000,
        formats: [BarcodeFormat.codabar],
        returnImage: true,
        torchEnabled: true,
        invertImage: false,
        autoZoom: true,
      );
  @override
  void onInit() {
    super.onInit();
    getUser();
    pageController.addListener(_onPageChanged);
  }

  void getUser() async {
    try {
      final response = supabase.auth.currentUser;
      if (response != null) {
        var lUser = await supabase
            .from("users")
            .select("*")
            .eq("user_id", response.id)
            .single();
        user.value = UserModel.fromJson(lUser);
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Palette.redOpacity,
        colorText: Palette.red,
      );
    }
  }

  void _onPageChanged() {
    currentIndex.value = pageController.page!.toInt();
  }

  @override
  void dispose() {
    pageController.removeListener(_onPageChanged);
    pageController.dispose();
    super.dispose();
  }
}
