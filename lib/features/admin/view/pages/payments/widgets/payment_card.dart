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
                      child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: WidgetSizes.spacingXs),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Durum',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            CarFormatter.paymentStatusFormat(
                              payment.paymentStatus ?? 0,
                            ),
                            style: payment.paymentStatus == 2
                                ? const TextStyle(color: Colors.green)
                                : const TextStyle(color: Colors.red) ??
                                    TextStyle(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  )
                      //  _buildDetailRow(
                      //                   context,
                      //                   'Durum:',
                      //                   CarFormatter.paymentStatusFormat(
                      //                     payment.paymentStatus ?? 0,
                      //                   ),
                      //                 ),
                      ),
                ],
              ),
              const Divider(),
              _buildDetailRow(
                context,
                'Ödeme Yöntemi:',
                CarFormatter.paymentMethodFormat(payment.paymentMethod ?? 0),
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
