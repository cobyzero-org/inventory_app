import 'package:flutter/material.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:inventory_app/ui/widgets/app_appbar.dart';
import 'package:inventory_app/ui/widgets/app_input.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';
import 'package:sizer/sizer.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppAppbar(
        title: "Listado de productos",
        subtitle: "Administra de manera eficiente",
        icon: Icon(Icons.inventory_2_outlined),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 2.h),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Palette.white,
                borderRadius: BorderRadius.circular(Constants.radius),
                border: Border.all(color: Palette.border),
              ),
              child: AppInput(
                hintText: "Buscar producto",
                prefixIcon: Icon(Icons.search),
              ),
            ),
            AppText.regular(text: "12 Productos Listados", fontSize: 14),
            SizedBox(height: 2.h),
            Expanded(
              child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 2.h),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 2.h,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Palette.white,
                      borderRadius: BorderRadius.circular(Constants.radius),
                      border: Border.all(color: Palette.border),
                    ),
                    child: AppInput(
                      hintText: "Buscar producto",
                      prefixIcon: Icon(Icons.search),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
