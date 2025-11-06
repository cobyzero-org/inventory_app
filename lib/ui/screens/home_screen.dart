import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_app/app/controllers/home_controller.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:inventory_app/domain/models/user_model.dart';
import 'package:inventory_app/ui/widgets/app_appbar.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';
import 'package:inventory_app/ui/widgets/home_action_item.dart';
import 'package:inventory_app/ui/widgets/home_banner_item.dart';
import 'package:inventory_app/ui/widgets/home_dates_historics.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({
    super.key,
    required this.pageController,
    required this.user,
  });
  final PageController pageController;
  final UserModel? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppAppbar(
        title: user?.name ?? "",
        subtitle: user?.companyName ?? "",
        icon: Image.asset("assets/images/icon.png"),
        action: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: controller.logout,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getProductsCounter();
          controller.getEntriesCounter();
          controller.getExitsCounter();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Constants.padding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.h),
                AppText.bold(text: "Bienvenido!", fontSize: 17),
                AppText.regular(
                  text: "Administra tus inventarios de manera eficiente",
                  fontSize: 15,
                ),
                SizedBox(height: 2.h),
                HomeBannerItem(
                  title: "Inventory IA",
                  subtitle:
                      "Participa en nuestra prueba beta de IA para gestionar tus inventarios",
                  icon: Icons.message,
                  color: Palette.primary,
                ),
                SizedBox(height: 2.h),
                AppText.bold(text: "Acceso rapido", fontSize: 16),
                SizedBox(height: 1.h),
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisSpacing: 4.w,
                  mainAxisSpacing: 2.h,
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 2,
                  children: [
                    HomeActionItem(
                      icon: Icons.qr_code,
                      title: "Escaner",
                      color: Palette.chart1,
                      onTap: () {
                        pageController.jumpToPage(3);
                      },
                    ),
                    HomeActionItem(
                      icon: Icons.moving,
                      title: "Salidas",
                      color: Palette.chart2,
                      onTap: () {
                        Get.toNamed('/exits');
                      },
                    ),
                    HomeActionItem(
                      icon: Icons.transit_enterexit,
                      title: "Entradas",
                      color: Palette.chart3,
                      onTap: () {},
                    ),
                    HomeActionItem(
                      icon: Icons.bar_chart,
                      title: "Reportes",
                      color: Palette.chart4,
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                HomeDatesHistorics(),
                SizedBox(height: 4.h),
                HomeBannerItem(
                  title: "Escanear rápidamente",
                  subtitle:
                      "Escanea los productos para agregarlos a tu inventario",
                  icon: Icons.qr_code,
                  color: Palette.chart2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
