import 'package:flutter/material.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/features/home/view/home_view.dart';
import 'package:rent_a_car/product/initialize/service/models/car/car.dart';
import 'package:rent_a_car/product/initialize/service/models/dealership/dealership.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';
import 'package:rent_a_car/product/utils/formatters/formatters.dart';

mixin HomeViewMixin on State<HomeView> {
  late final TextEditingController minPriceController;
  late final TextEditingController maxPriceController;

  String selectedSort = 'Varsayılan';
  String selectedFuelType = 'Hepsi';
  late final RentACarService _rentACarService;
  List<Car>? cars;

  late final int dayCount;
  late final String startDate;
  late final String endDate;
  late final DateTime startDateWithTime;
  late final DateTime endDateWithTime;
  late final int selectedDealerId;
  @override
  void initState() {
    super.initState();
    dayCount = widget.parameters['dayCount'] as int;
    startDate = widget.parameters['startDate'] as String;
    endDate = widget.parameters['endDate'] as String;
    selectedDealerId = widget.parameters['selectedDealership'] as int;
    startDateWithTime = widget.parameters['startDateWithTime'] as DateTime;
    endDateWithTime = widget.parameters['endDateWithTime'] as DateTime;

    minPriceController = TextEditingController();
    maxPriceController = TextEditingController();
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
