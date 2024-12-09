import 'package:flutter/material.dart';
import 'package:rent_a_car/features/admin/view/pages/payments/view/mixin/payments_page_mixin.dart';
import 'package:rent_a_car/features/admin/view/pages/payments/widgets/payment_card.dart';

class PaymentsPageView extends StatefulWidget {
  const PaymentsPageView({super.key});

  @override
  State<PaymentsPageView> createState() => _PaymentsPageViewState();
}

class _PaymentsPageViewState extends State<PaymentsPageView>
    with PaymentsPageViewMixin {
  @override
  Widget build(BuildContext context) {
    if (payments == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (payments!.isEmpty) {
      return const Center(
        child: Text('No payments available.'),
      );
    }

    return ListView.builder(
      itemCount: payments!.length,
      itemBuilder: (BuildContext context, int index) {
        final payment = payments![index];
        return PaymentCard(
          payment: payment,
          onDelete: () {},
          onUpdate: () {},
        );
      },
    );
  }
}
