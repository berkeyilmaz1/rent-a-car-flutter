import 'package:flutter/material.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/features/home/view/home_view.dart';
import 'package:rent_a_car/product/initialize/service/models/car/car.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';

mixin HomeViewMixin on State<HomeView> {
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();

  String selectedFuelType = 'Hepsi';
  late final RentACarService _rentACarService;
  List<Car>? cars;
  @override
  void initState() {
    super.initState();

    _rentACarService = RentACarService(
      networkManager: ProductNetworkManager(),
    );

    fetchCars();
    print(' daycount: ${widget.dayCount}');
  }

  Future<void> fetchCars() async {
    final response = await _rentACarService.getAllCars();
    setState(() {
      cars = response;
    });
  }
}
