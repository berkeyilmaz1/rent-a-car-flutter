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

    // setState(() {
    //   reservations = [
    //     Reservation(
    //       id: 1,
    //       userId: 'user_12345',
    //       carId: 'car_98765',
    //       startDate: '2024-12-10',
    //       endDate: '2024-12-15',
    //       totalPrice: 500,
    //       status:
    //           1, // 1: Active, 0: Cancelled gibi bir kullanım varsayılmıştır.
    //       createdDate: '2024-12-01',
    //       updatedDate: '2024-12-05',
    //       car: Car(
    //         brand: 'Toyota',
    //         model: 'Corolla',
    //         licensePlate: '34ABC123',
    //         vinNumber: 'JTDBU4EE9B9123456',
    //       ),
    //     ),
    //     Reservation(
    //       id: 1,
    //       userId: 'user_12345',
    //       carId: 'car_98765',
    //       startDate: '2024-12-10',
    //       endDate: '2024-12-15',
    //       totalPrice: 500,
    //       status:
    //           1, // 1: Active, 0: Cancelled gibi bir kullanım varsayılmıştır.
    //       createdDate: '2024-12-01',
    //       updatedDate: '2024-12-05',
    //       car: Car(
    //         brand: 'Toyota',
    //         model: 'Corolla',
    //         licensePlate: '34ABC123',
    //         vinNumber: 'JTDBU4EE9B9123456',
    //       ),
    //     ),
    //     Reservation(
    //       id: 1,
    //       userId: 'user_12345',
    //       carId: 'car_98765',
    //       startDate: '2024-12-10',
    //       endDate: '2024-12-15',
    //       totalPrice: 500,
    //       status:
    //           1, // 1: Active, 0: Cancelled gibi bir kullanım varsayılmıştır.
    //       createdDate: '2024-12-01',
    //       updatedDate: '2024-12-05',
    //       car: Car(
    //         brand: 'Toyota',
    //         model: 'Corolla',
    //         licensePlate: '34ABC123',
    //         vinNumber: 'JTDBU4EE9B9123456',
    //       ),
    //     ),
    //     Reservation(
    //       id: 1,
    //       userId: 'user_12345',
    //       carId: 'car_98765',
    //       startDate: '2024-12-10',
    //       endDate: '2024-12-15',
    //       totalPrice: 500,
    //       status:
    //           1, // 1: Active, 0: Cancelled gibi bir kullanım varsayılmıştır.
    //       createdDate: '2024-12-01',
    //       updatedDate: '2024-12-05',
    //       car: Car(
    //         brand: 'Toyota',
    //         model: 'Corolla',
    //         licensePlate: '34ABC123',
    //         vinNumber: 'JTDBU4EE9B9123456',
    //       ),
    //     ),
    //   ];
    // });
  }
}
