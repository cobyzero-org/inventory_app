import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:inventory_app/domain/models/product_model.dart';
import 'package:sizer/sizer.dart';

class CircularChart extends StatelessWidget {
  const CircularChart({super.key, required this.products, required this.title});
  final List<ProductModel> products;
  final String title;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(title, style: theme.textTheme.titleMedium),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 50.w,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    PieChartData(
                      borderData: FlBorderData(show: false),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections(context),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: products
                      .map(
                        (product) => Indicator(
                          text: product.name,
                          color: randomColor(product.id + product.stock),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Color randomColor(int index) {
    return Color.fromARGB(255, index * 7 + 2, index * 1, index * 2);
  }

  List<PieChartSectionData> showingSections(BuildContext context) {
    return products
        .map(
          (product) => PieChartSectionData(
            color: randomColor(product.id + product.stock),
            value: product.stock.toDouble(),
            title: product.stock.toString(),
            radius: 50,
            titleStyle: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: Colors.white),
          ),
        )
        .toList();
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.text,
    required this.color,
    this.size = 12,
    this.textColor,
  });
  final String text;
  final double size;
  final Color? textColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}
