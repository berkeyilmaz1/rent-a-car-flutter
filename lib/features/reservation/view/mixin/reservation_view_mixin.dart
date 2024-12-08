import 'package:flutter/material.dart';
import 'package:rent_a_car/features/reservation/view/reservation_view.dart';
import 'package:rent_a_car/product/initialize/service/models/car/car.dart';

mixin ReservationViewMixin on State<ReservationView> {
  // ignore: prefer_final_fields
  int _currentStep = 1;

  set currentStep(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  late final Car car;
  int get currentStep => _currentStep;

  @override
  void initState() {
    super.initState();
    car = Car(
      vinNumber: '1HGCM82633A123456',
      brand: 'Toyota',
      model: 'Corolla',
      year: 2022,
      fuelType: 1,
      gearType: 2,
      licensePlate: '34ABC123',
      seatCount: 5,
      pricePerDay: 300,
      availabilityStatus: true,
      createdAt: '2024-12-08T10:00:00Z',
      updatedAt: '2024-12-08T15:00:00Z',
      minAge: 21,
      kilometer: 25000,
      dealershipId: 101,
    );
  }
}
