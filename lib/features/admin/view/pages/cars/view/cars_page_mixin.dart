import 'package:flutter/material.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/features/admin/view/pages/cars/view/cars_page_view.dart';
import 'package:rent_a_car/product/initialize/service/models/car/car.dart';
import 'package:rent_a_car/product/initialize/service/models/car/update_car_request.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';

mixin CarsPageMixin on State<CarsPageView> {
  late final RentACarService _rentACarService;
  List<Car>? cars;
  @override
  void initState() {
    super.initState();

    _rentACarService = RentACarService(
      networkManager: ProductNetworkManager(),
    );

    fetchCars();
  }

  Future<void> saveOnPressed(UpdateCarRequest car, String vinNumber) async {
    await _rentACarService.updateCar(car, vinNumber);
  }

  Future<void> deleteOnPressed(String vinNumber) async {
    await _rentACarService.deleteCar(vinNumber);
  }

  Future<void> fetchCars() async {
    final response = await _rentACarService.getAllCars();
    setState(() {
      cars = response;
    });

    // cars = [
    //   Car(
    //     vinNumber: '1HGCM82633A123456',
    //     brand: 'Honda',
    //     model: 'Civic',
    //     year: 2020,
    //     fuelType: 1,
    //     gearType: 2,
    //     licensePlate: '34ABC123',
    //     seatCount: 5,
    //     pricePerDay: 100,
    //     availabilityStatus: true,
    //     createdAt: '2024-12-07T12:00:00Z',
    //     updatedAt: '2024-12-07T12:00:00Z',
    //     minAge: 21,
    //     kilometer: 15000,
    //     dealershipId: 1,
    //   ),
    //   Car(
    //     vinNumber: '1HGCM82633A123456',
    //     brand: 'Honda',
    //     model: 'Civic',
    //     year: 2020,
    //     fuelType: 1,
    //     gearType: 2,
    //     licensePlate: '34ABC123',
    //     seatCount: 5,
    //     pricePerDay: 100,
    //     availabilityStatus: true,
    //     createdAt: '2024-12-07T12:00:00Z',
    //     updatedAt: '2024-12-07T12:00:00Z',
    //     minAge: 21,
    //     kilometer: 15000,
    //     dealershipId: 1,
    //   ),
    //   Car(
    //     vinNumber: '1HGCM82633A123456',
    //     brand: 'Honda',
    //     model: 'Civic',
    //     year: 2020,
    //     fuelType: 1,
    //     gearType: 2,
    //     licensePlate: '34ABC123',
    //     seatCount: 5,
    //     pricePerDay: 100,
    //     availabilityStatus: true,
    //     createdAt: '2024-12-07T12:00:00Z',
    //     updatedAt: '2024-12-07T12:00:00Z',
    //     minAge: 21,
    //     kilometer: 15000,
    //     dealershipId: 1,
    //   ),
    //   Car(
    //     vinNumber: '1HGCM82633A123456',
    //     brand: 'Honda',
    //     model: 'Civic',
    //     year: 2020,
    //     fuelType: 1,
    //     gearType: 2,
    //     licensePlate: '34ABC123',
    //     seatCount: 5,
    //     pricePerDay: 100,
    //     availabilityStatus: true,
    //     createdAt: '2024-12-07T12:00:00Z',
    //     updatedAt: '2024-12-07T12:00:00Z',
    //     minAge: 21,
    //     kilometer: 15000,
    //     dealershipId: 1,
    //   ),
    //   Car(
    //     vinNumber: '1HGCM82633A123456',
    //     brand: 'Honda',
    //     model: 'Civic',
    //     year: 2020,
    //     fuelType: 1,
    //     gearType: 2,
    //     licensePlate: '34ABC123',
    //     seatCount: 5,
    //     pricePerDay: 100,
    //     availabilityStatus: true,
    //     createdAt: '2024-12-07T12:00:00Z',
    //     updatedAt: '2024-12-07T12:00:00Z',
    //     minAge: 21,
    //     kilometer: 15000,
    //     dealershipId: 1,
    //   ),
    //   Car(
    //     vinNumber: '1HGCM82633A123456',
    //     brand: 'Honda',
    //     model: 'Civic',
    //     year: 2020,
    //     fuelType: 1,
    //     gearType: 2,
    //     licensePlate: '34ABC123',
    //     seatCount: 5,
    //     pricePerDay: 100,
    //     availabilityStatus: true,
    //     createdAt: '2024-12-07T12:00:00Z',
    //     updatedAt: '2024-12-07T12:00:00Z',
    //     minAge: 21,
    //     kilometer: 15000,
    //     dealershipId: 1,
    //   ),
    //   Car(
    //     vinNumber: '1HGCM82633A123456',
    //     brand: 'Honda',
    //     model: 'Civic',
    //     year: 2020,
    //     fuelType: 1,
    //     gearType: 2,
    //     licensePlate: '34ABC123',
    //     seatCount: 5,
    //     pricePerDay: 100,
    //     availabilityStatus: true,
    //     createdAt: '2024-12-07T12:00:00Z',
    //     updatedAt: '2024-12-07T12:00:00Z',
    //     minAge: 21,
    //     kilometer: 15000,
    //     dealershipId: 1,
    //   ),
    //   Car(
    //     vinNumber: '1HGCM82633A123456',
    //     brand: 'Honda',
    //     model: 'Civic',
    //     year: 2020,
    //     fuelType: 1,
    //     gearType: 2,
    //     licensePlate: '34ABC123',
    //     seatCount: 5,
    //     pricePerDay: 100,
    //     availabilityStatus: true,
    //     createdAt: '2024-12-07T12:00:00Z',
    //     updatedAt: '2024-12-07T12:00:00Z',
    //     minAge: 21,
    //     kilometer: 15000,
    //     dealershipId: 1,
    //   ),
    //   Car(
    //     vinNumber: '1HGCM82633A123456',
    //     brand: 'Honda',
    //     model: 'Civic',
    //     year: 2020,
    //     fuelType: 1,
    //     gearType: 2,
    //     licensePlate: '34ABC123',
    //     seatCount: 5,
    //     pricePerDay: 100,
    //     availabilityStatus: true,
    //     createdAt: '2024-12-07T12:00:00Z',
    //     updatedAt: '2024-12-07T12:00:00Z',
    //     minAge: 21,
    //     kilometer: 15000,
    //     dealershipId: 1,
    //   ),
    //   Car(
    //     vinNumber: '1HGCM82633A123456',
    //     brand: 'Honda',
    //     model: 'Civic',
    //     year: 2020,
    //     fuelType: 1,
    //     gearType: 2,
    //     licensePlate: '34ABC123',
    //     seatCount: 5,
    //     pricePerDay: 100,
    //     availabilityStatus: true,
    //     createdAt: '2024-12-07T12:00:00Z',
    //     updatedAt: '2024-12-07T12:00:00Z',
    //     minAge: 21,
    //     kilometer: 15000,
    //     dealershipId: 1,
    //   ),
    //   Car(
    //     vinNumber: '1HGCM82633A123456',
    //     brand: 'Honda',
    //     model: 'Civic',
    //     year: 2020,
    //     fuelType: 1,
    //     gearType: 2,
    //     licensePlate: '34ABC123',
    //     seatCount: 5,
    //     pricePerDay: 100,
    //     availabilityStatus: true,
    //     createdAt: '2024-12-07T12:00:00Z',
    //     updatedAt: '2024-12-07T12:00:00Z',
    //     minAge: 21,
    //     kilometer: 15000,
    //     dealershipId: 1,
    //   ),
    // ];
  }
}
