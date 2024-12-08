import 'package:flutter/material.dart';
import 'package:rent_a_car/features/admin/view/pages/payments/view/mixin/payments_page_mixin.dart';

class PaymentsPageView extends StatefulWidget {
  const PaymentsPageView({super.key});

  @override
  State<PaymentsPageView> createState() => _PaymentsPageViewState();
}

class _PaymentsPageViewState extends State<PaymentsPageView>
    with PaymentsPageViewMixin {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
