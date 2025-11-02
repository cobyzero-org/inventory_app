import 'package:flutter/material.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:inventory_app/ui/widgets/app_appbar.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';
import 'package:inventory_app/ui/widgets/home_action_item.dart';
import 'package:inventory_app/ui/widgets/home_banner_item.dart';
import 'package:inventory_app/ui/widgets/home_dates_historics.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppAppbar(
        title: "Invex",
        subtitle: "Inventory Management",
        icon: Image.asset("assets/images/icon.png"),
      ),
      body: Padding(
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
                title: "Escaner de productos",
                subtitle:
                    "Escanea los productos para agregarlos a tu inventario",
                icon: Icons.qr_code,
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
                  ),
                  HomeActionItem(
                    icon: Icons.moving,
                    title: "Salidas",
                    color: Palette.chart2,
                  ),
                  HomeActionItem(
                    icon: Icons.transit_enterexit,
                    title: "Entradas",
                    color: Palette.chart3,
                  ),
                  HomeActionItem(
                    icon: Icons.bar_chart,
                    title: "Reportes",
                    color: Palette.chart4,
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              HomeDatesHistorics(),
              SizedBox(height: 4.h),
              HomeBannerItem(
                title: "Incrementar stock",
                subtitle:
                    "Recuerda que puedes incrementar el stock de los productos que ya esten en tu inventario",
                icon: Icons.flood_rounded,
                color: Palette.chart2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
