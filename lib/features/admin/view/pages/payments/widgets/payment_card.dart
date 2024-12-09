import 'package:flutter/material.dart';
import 'package:rent_a_car/product/initialize/service/models/payment/payment.dart';
import 'package:rent_a_car/product/utils/formatters/formatters.dart';

final class PaymentCard extends StatelessWidget {
  const PaymentCard({
    required this.payment,
    super.key,
  });

  final Payment payment;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Payment ID: ${payment.id}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Reservation ID: ${payment.reservationId}'),
          Text('Amount: ${payment.amount}'),
          Text('Date: ${payment.createdAt}'),
          Text(
            'Status: ${CarFormatter.paymentStatusFormat(payment.paymentStatus ?? 0)}',
          ),
          Text(
            'Payment Method: ${CarFormatter.paymentMethodFormat(payment.paymentMethod ?? 0)}',
          ),
        ],
      ),
    );
  }
}
