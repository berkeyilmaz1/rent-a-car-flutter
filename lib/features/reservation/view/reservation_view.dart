import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_a_car/features/home/widgets/car_card.dart';
import 'package:rent_a_car/features/payment/view/payment_view.dart';
import 'package:rent_a_car/features/reservation/view/mixin/reservation_view_mixin.dart';
import 'package:rent_a_car/features/reservation/widgets/car_info.dart';
import 'package:rent_a_car/features/reservation/widgets/driver_info_form.dart';
import 'package:rent_a_car/product/initialize/service/models/car/car.dart';
import 'package:rent_a_car/product/utils/border_radius_general.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

part 'step_pages/driver_info_view.dart';

final class ReservationView extends StatefulWidget {
  const ReservationView({super.key});
  // final Car car;

  @override
  State<ReservationView> createState() => _ReservationViewState();
}

class _ReservationViewState extends State<ReservationView>
    with ReservationViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stepper(
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return const SizedBox.shrink();
              },
              steps: [
                Step(
                  title: const Text('Araç Seçimi'),
                  content: const SizedBox.shrink(),
                  isActive: currentStep == 0,
                ),
                Step(
                  title: const Text('Sürücü Bilgileri'),
                  content: DriverInfoView(
                    ///todo: change car to widget.car
                    car: Car(
                      model: 'Corolla',
                      fuelType: 1,
                      gearType: 1,
                      kilometer: 500,
                      minAge: 20,
                      seatCount: 5,
                      vinNumber: '12345',
                      brand: 'Toyota',
                    ),
                  ),
                  isActive: currentStep == 1,
                ),
                Step(
                  title: const Text('Ödeme'),
                  content: const PaymentView(),
                  isActive: currentStep == 2,
                ),
              ],
              onStepTapped: (value) {
                //todo home olarak değiştir ve daycount ekle, provider kullanabilirsin burda ya da param pasla
                if (value == 0) context.go('/selection');
                setState(() {
                  currentStep = value;
                });
              },
              currentStep: currentStep,
              type: StepperType.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}

