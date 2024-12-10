import 'package:flutter/material.dart';
import 'package:rent_a_car/product/initialize/service/models/dealership/dealership.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

class DealerCard extends StatelessWidget {
  const DealerCard({
    required this.dealer,
    required this.onUpdate,
    required this.onDelete,
    super.key,
  });

  final DealerShip dealer;
  final VoidCallback onUpdate;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: WidgetSizes.spacingXs,
        horizontal: WidgetSizes.spacingM,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.1),
      child: Padding(
        padding: const PagePadding.allLow(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.location_city_rounded),
                const SizedBox(width: WidgetSizes.spacingXs),
                Text(
                  dealer.name ?? 'Bayi Adı Yok',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                ),
                const Spacer(),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: onUpdate,
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: onDelete,
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
            _buildDetailRow('Adres:', dealer.address ?? '-'),
            _buildDetailRow('Telefon:', dealer.phone ?? '-'),
            // _buildDetailRow('Araç Sayısı:', '${dealer.cars?.length ?? 0}'),
            const SizedBox(height: WidgetSizes.spacingXs),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: WidgetSizes.spacingXs),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
