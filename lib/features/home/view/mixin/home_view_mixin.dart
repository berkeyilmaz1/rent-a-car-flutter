import 'package:flutter/material.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/features/home/view/home_view.dart';
import 'package:rent_a_car/product/initialize/service/models/car/car.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';
import 'package:rent_a_car/product/utils/formatters/formatters.dart';

mixin HomeViewMixin on State<HomeView> {
  late final TextEditingController minPriceController;
  late final TextEditingController maxPriceController;

  String selectedSortOrder = 'Varsayılan';
  String selectedFuelType = 'Hepsi';
  late final RentACarService _rentACarService;
  List<Car>? cars;
  List<Car> filteredCars = [];
  late final int dayCount;
  late final String startDate;
  late final String endDate;
  late final DateTime startDateWithTime;
  late final DateTime endDateWithTime;
  late final int selectedDealerId;
  double minPrice = 0.0;
  double maxPrice = 1000.0;
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
      filteredCars = response ?? [];
    });
  }

  List<Car> filterCarsByPrice(double minPrice, double maxPrice) {
    return cars!
        .where((car) =>
            car.pricePerDay! >= minPrice && car.pricePerDay! <= maxPrice)
        .toList();
  }

  List<Car> sortCarsByPrice(bool ascending) {
    cars?.sort(
      (a, b) => ascending
          ? a.pricePerDay!.compareTo(b.pricePerDay ?? 0)  
          : b.pricePerDay!.compareTo(a.pricePerDay ?? 0), 
    );
    return cars ?? [];
  }

  List<Car> filterCarsByFuelType(String fuelType) {
    if (fuelType == 'Hepsi') {
      return cars ?? [];  
    }
    return cars
            ?.where((car) =>
                CarFormatter.fuelTypeFormat(car.fuelType ?? 0) == fuelType)
            .toList() ??
        [];
  }

  Widget buildSortDropdown() {
    return DropdownButton<String>(
      value: selectedSortOrder,
      onChanged: (String? newValue) {
        setState(() {
          selectedSortOrder = newValue!;
          if (selectedSortOrder == 'Fiyata Göre Azalan') {
            filteredCars = sortCarsByPrice(false);
          } else if (selectedSortOrder == 'Fiyata Göre Artan') {
            filteredCars = sortCarsByPrice(true);  
          }
        });
      },
      items: <String>[
        'Varsayılan',  
        'Fiyata Göre Azalan',  
        'Fiyata Göre Artan'  
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget buildPriceRangeSlider() {
    return RangeSlider(
      values: RangeValues(minPrice, maxPrice),
      min: 0,
      max: 10000,
      divisions: 100,
      labels: RangeLabels(
        '\$${minPrice.toStringAsFixed(0)}',
        '\$${maxPrice.toStringAsFixed(0)}',
      ),
      onChanged: (RangeValues values) {
        setState(() {
          minPrice = values.start;
          maxPrice = values.end;
          filteredCars = filterCarsByPrice(minPrice, maxPrice);  
        });
      },
    );
  }

  Widget buildFuelTypeDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedFuelType,
      onChanged: (value) {
        setState(() {
          selectedFuelType = value ?? 'Hepsi';
          filteredCars = filterCarsByFuelType(selectedFuelType);
        });
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Yakıt Tipi',
      ),
      items: [
        'Hepsi',
        'Benzin',
        'Dizel',
        'Elektrik',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
