import 'package:flutter/material.dart';
import 'package:rent_a_car/features/admin/view/pages/payments/widgets/payment_button.dart';
import 'package:rent_a_car/product/initialize/service/models/payment/payment.dart';
import 'package:rent_a_car/product/utils/formatters/formatters.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

final class PaymentCard extends StatelessWidget {
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
            CardRow(label: 'Payment ID:', value: payment.id.toString()),
            CardRow(
              label: 'Reservation ID:',
              value: payment.reservationId.toString(),
            ),
            CardRow(label: 'Amount:', value: payment.amount.toString()),
            CardRow(label: 'Date:', value: payment.createdAt.toString()),
            CardRow(
              label: 'Status:',
              value:
                  CarFormatter.paymentStatusFormat(payment.paymentStatus ?? 0),
            ),
            CardRow(
              label: 'Payment Method:',
              value:
                  CarFormatter.paymentMethodFormat(payment.paymentMethod ?? 0),
            ),
            const SizedBox(height: WidgetSizes.spacingM),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AdminButton(
                  color: Colors.blue,
                  label: 'Güncelle',
                  onPressed: () {},
                ),
                const SizedBox(width: WidgetSizes.spacingM),
                AdminButton(
                  color: Colors.red,
                  label: 'Sil',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final class CardRow extends StatelessWidget {
  const CardRow({required this.label, required this.value, super.key});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: WidgetSizes.spacingM,
            ),
          ),
          Text(
            value,
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
