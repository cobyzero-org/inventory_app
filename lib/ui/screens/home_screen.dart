import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_app/app/controllers/home_controller.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:inventory_app/domain/models/user_model.dart';
import 'package:inventory_app/ui/widgets/app_appbar.dart';
import 'package:inventory_app/ui/widgets/home_action_item.dart';
import 'package:inventory_app/ui/widgets/home_banner_item.dart';
import 'package:inventory_app/ui/widgets/home_dates_historics.dart';
import 'package:ionicons/ionicons.dart';
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
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppAppbar(
        title: user?.name ?? "",
        subtitle: user?.companyName ?? "",
        icon: Image.asset("assets/images/icon.png"),
        action: IconButton(
          icon: const Icon(Ionicons.exit_outline),
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
                Text("Bienvenido!", style: theme.textTheme.titleMedium),
                Text(
                  "Administra tus inventarios de manera eficiente",
                  style: theme.textTheme.bodyMedium,
                ),
                SizedBox(height: 2.h),
                HomeBannerItem(
                  title: "Escanear rápidamente",
                  subtitle:
                      "Escanea los productos para gestionar salidas y entradas",
                  icon: Ionicons.barcode_outline,
                  color: Palette.chart2,
                  onTap: () {
                    pageController.jumpToPage(3);
                  },
                ),
                SizedBox(height: 2.h),
                Text("Acceso rapido", style: theme.textTheme.titleMedium),
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
                      icon: Ionicons.barcode_outline,
                      title: "Escaner",
                      color: Palette.chart1,
                      onTap: () {
                        pageController.jumpToPage(3);
                      },
                    ),
                    HomeActionItem(
                      icon: Ionicons.trending_up_outline,
                      title: "Salidas",
                      color: Palette.chart2,
                      onTap: () {
                        Get.toNamed('/exits');
                      },
                    ),
                    HomeActionItem(
                      icon: Ionicons.trending_down_outline,
                      title: "Entradas",
                      color: Palette.chart3,
                      onTap: () {
                        Get.toNamed('/entries');
                      },
                    ),
                    HomeActionItem(
                      icon: Ionicons.reader_outline,
                      title: "Reportes",
                      color: Palette.chart4,
                      onTap: () {
                        Get.toNamed('/reports');
                      },
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                HomeDatesHistorics(),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
