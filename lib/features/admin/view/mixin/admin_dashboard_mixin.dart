import 'package:flutter/material.dart';
import 'package:rent_a_car/features/admin/view/admin_dashboard_view.dart';
import 'package:rent_a_car/features/admin/view/pages/cars/cars_page_view.dart';
import 'package:rent_a_car/features/admin/view/pages/payments/payments_page_view.dart';
import 'package:rent_a_car/features/admin/view/pages/reservations/reservations_page_view.dart';
import 'package:rent_a_car/features/admin/view/pages/users/users_page.view.dart';

mixin AdminDashboardMixin on State<AdminDashboardView> {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  // List of possible pages/views
  final List<Widget> _pages = [
    const CarsPageView(),
    const UsersPageView(),
    const ReservationsPageView(),
    const PaymentsPageView(),
  ];

  List<Widget> get pages => _pages;

  void onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Optional: Close the drawer
    Navigator.of(context).pop();
  }
}
