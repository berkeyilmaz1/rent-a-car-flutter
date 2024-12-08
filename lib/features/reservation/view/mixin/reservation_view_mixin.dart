import 'package:flutter/material.dart';
import 'package:rent_a_car/features/reservation/view/reservation_view.dart';
import 'package:rent_a_car/product/initialize/service/models/car/car.dart';

mixin ReservationViewMixin on State<ReservationView> {
  int _currentStep = 1;

  set currentStep(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  late final Car car;
  late final String startDate;
  late final String endDate;
  late final int dayCount;
  late final DateTime startDateWithTime;
  late final DateTime endDateWithTime;
  int get currentStep => _currentStep;

  @override
  void initState() {
    super.initState();

    car = widget.parameters['car'] as Car;
    startDate = widget.parameters['startDate'] as String;
    endDate = widget.parameters['endDate'] as String;
    dayCount = widget.parameters['dayCount'] as int;
    startDateWithTime = widget.parameters['startDateWithTime'] as DateTime;
    endDateWithTime = widget.parameters['endDateWithTime'] as DateTime;
  }
}
