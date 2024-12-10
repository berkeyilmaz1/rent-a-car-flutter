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

  

  Future<void> fetchCars() async {
    final response = await _rentACarService.getAllCars();
    setState(() {
      cars = response;
    });
  }
}
