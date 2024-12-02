import 'package:flutter/material.dart';
import 'package:rent_a_car/features/home/view/home_view.dart';
import 'package:rent_a_car/product/initialize/service/models/car.dart';

mixin HomeViewMixin on State<HomeView> {
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();

  // Variable to store the selected fuel type
  String selectedFuelType = 'Hepsi';
  final carList = [
    Car(
      vinNumber: '1HGCM82633A123456',
      brand: 'Toyota',
      model: 'Corolla',
      year: 2021,
      fuelType: 1,
      gearType: 2,
      licensePlate: '34ABC123',
      seatCount: 5,
      pricePerDay: 150,
      availabilityStatus: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      minAge: 21,
      kilometer: 50000,
      dealershipId: 1,
      dealership: Dealership(
        id: 1,
        name: 'Best Auto Dealership',
      ),
      reservations: [
        Reservation(id: 201),
        Reservation(id: 202),
      ],
    ),
  ];
}
