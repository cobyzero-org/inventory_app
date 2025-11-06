import 'package:flutter/material.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:inventory_app/domain/models/product_model.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.bold(
                        text: product.name,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                      const SizedBox(height: 4),
                      AppText.regular(
                        text: product.description ?? "",
                        fontSize: 13,
                        color: Colors.grey,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Estado
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.regular(
                  text: 'Disponibilidad:',
                  fontSize: 14,
                  color: Colors.grey,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: product.stock > 0
                        ? Palette.greenOpacity
                        : Palette.redOpacity,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: AppText.regular(
                    text: product.stock > 0 ? "Disponible" : "No disponible",
                    fontSize: 14,
                    color: product.stock > 0 ? Palette.green : Palette.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Detalles
            GridView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 8,
                childAspectRatio: 3,
              ),
              children: [
                _buildDetailItem('Stock', product.stock.toString()),
                _buildDetailItem(
                  'Precio unitario',
                  product.unitPrice.toString(),
                ),
                _buildDetailItem('Categoria', product.category?.name ?? ""),
                _buildDetailItem('Comming Soon', "coming soon"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
      ],
    );
  }
}
