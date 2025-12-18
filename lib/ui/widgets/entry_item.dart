import 'package:flutter/material.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/core/utils/palette.dart';
import 'package:inventory_app/domain/models/entry_model.dart';
import 'package:inventory_app/ui/widgets/app_text.dart';

class EntryItem extends StatelessWidget {
  const EntryItem({super.key, required this.entry});
  final EntryModel entry;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(Constants.radius),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
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
                        text: entry.product?.name ?? "",
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                      const SizedBox(height: 4),
                      AppText.regular(
                        text: entry.product?.description ?? "",
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
                  text: 'Estado:',
                  fontSize: 14,
                  color: Colors.grey,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Palette.greenOpacity,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: AppText.regular(
                    text: "Entrada",
                    fontSize: 14,
                    color: Palette.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
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
                _buildDetailItem('Cantidad', entry.quantity.toString()),
                _buildDetailItem(
                  'Precio unitario',
                  entry.product?.unitPrice.toString() ?? "",
                ),
                _buildDetailItem('Cliente', entry.userId?.toString() ?? ""),
                _buildDetailItem('Dirección', entry.client?.address ?? ""),
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
