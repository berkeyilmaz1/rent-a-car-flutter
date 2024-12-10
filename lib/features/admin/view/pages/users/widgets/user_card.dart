import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rent_a_car/product/initialize/service/models/user/user.dart';
import 'package:rent_a_car/product/utils/border_radius_general.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    required this.user,
    required this.onUpdate,
    required this.onDelete,
    super.key,
  });

  final User user;
  final VoidCallback onUpdate;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const PagePadding.verticalLowSymmetric(),
      elevation: WidgetSizes.spacingXSs,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusGeneral.allLow(),
      ),
      child: Padding(
        padding: const PagePadding.all(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kullanıcı #${user.id}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                ),
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
            const SizedBox(height: WidgetSizes.spacingXs),
            _buildDetailRow(
              context,
              'İsim - Soyisim:',
              '${user.name} ${user.lastname}',
            ),
            _buildDetailRow(context, 'E-posta:', user.email ?? '-'),
            _buildDetailRow(context, 'Telefon:', user.phoneNumber ?? '-'),
            _buildDetailRow(
              context,
              'Doğum Tarihi:',
              DateFormat('yMMMMd', 'tr_TR')
                  .format(user.birthDate ?? DateTime.now()),
            ),
            _buildDetailRow(
              context,
              'Sürücü Seri Numarası:',
              user.licenseNumber ?? '-',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: WidgetSizes.spacingXs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
