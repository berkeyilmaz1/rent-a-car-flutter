import 'package:flutter/material.dart';
import 'package:rent_a_car/product/initialize/service/models/payment/payment.dart';
import 'package:rent_a_car/product/utils/border_radius_general.dart';
import 'package:rent_a_car/product/utils/formatters/formatters.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    required this.payment,
    required this.onUpdate,
    required this.onDelete,
    super.key,
  });

  final Payment payment;
  final VoidCallback onUpdate;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: Card(
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
                 children: [
                  const Icon(Icons.payment),
                  const SizedBox(width: WidgetSizes.spacingXs),
                  Text(
                    'Ödeme Id: ${payment.id}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: onDelete,
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: WidgetSizes.spacingXs),
              Row(
                children: [
                  Expanded(
                    child: _buildDetailRow(
                      context,
                      'Rezervasyon ID:',
                      payment.reservationId.toString(),
                    ),
                  ),
                  Expanded(
                    child: _buildDetailRow(
                      context,
                      'Tutar:',
                      payment.amount.toString(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: WidgetSizes.spacingXs),
              Row(
                children: [
                  Expanded(
                    child: _buildDetailRow(
                      context,
                      'Tarih:',
                      payment.createdAt.toString(),
                    ),
                  ),
                  Expanded(
                    child: _buildDetailRow(
                      context,
                      'Durum:',
                      CarFormatter.paymentStatusFormat(
                        payment.paymentStatus ?? 0,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              _buildDetailRow(
                context,
                'Ödeme Yöntemi:',
                CarFormatter.paymentMethodFormat(payment.paymentMethod ?? 0),
              ),
              const SizedBox(height: WidgetSizes.spacingM),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: onUpdate,
                    child: Text(
                      'Güncelle',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(width: WidgetSizes.spacingM),
                  TextButton(
                    onPressed: onDelete,
                    child: Text(
                      'Sil',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
 