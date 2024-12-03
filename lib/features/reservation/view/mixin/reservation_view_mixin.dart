import 'package:flutter/material.dart';
import 'package:rent_a_car/features/reservation/view/reservation_view.dart';

mixin ReservationViewMixin on State<ReservationView> {
  // ignore: prefer_final_fields
  int _currentStep = 1;

  set currentStep(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  int get currentStep => _currentStep;
}
