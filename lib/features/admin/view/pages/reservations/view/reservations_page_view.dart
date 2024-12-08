import 'package:flutter/material.dart';
import 'package:rent_a_car/features/admin/view/pages/reservations/view/mixin/reservations_page_view_mixin.dart';

class ReservationsPageView extends StatefulWidget {
  const ReservationsPageView({super.key});

  @override
  State<ReservationsPageView> createState() => _ReservationsPageViewState();
}

class _ReservationsPageViewState extends State<ReservationsPageView>
    with ReservationsPageViewMixin {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Reservations Management'));
  }
}
