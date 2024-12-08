import 'package:flutter/material.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/features/admin/view/pages/reservations/view/reservations_page_view.dart';
import 'package:rent_a_car/product/initialize/service/models/reservation/reservation.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';

mixin ReservationsPageViewMixin on State<ReservationsPageView> {
  late final RentACarService _rentACarService;

  List<Reservation>? reservations;

  @override
  void initState() {
    super.initState();
    _rentACarService = RentACarService(networkManager: ProductNetworkManager());

    fetchAllReservations();
  }

  Future<void> fetchAllReservations() async {
    final response = await _rentACarService.getAllReservations();

    if (reservations == null) return;
    setState(() {
      reservations = response;
    });
  }
}
