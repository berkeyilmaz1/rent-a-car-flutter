import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/features/home/widgets/car_card.dart';
import 'package:rent_a_car/features/payment/view/payment_view.dart';
import 'package:rent_a_car/features/reservation/view/mixin/reservation_view_mixin.dart';
import 'package:rent_a_car/features/reservation/widgets/car_info.dart';
import 'package:rent_a_car/features/reservation/widgets/driver_info_form.dart';
import 'package:rent_a_car/product/initialize/providers/user_provider.dart';
import 'package:rent_a_car/product/initialize/service/models/car/car.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';
import 'package:rent_a_car/product/utils/border_radius_general.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

part 'step_pages/driver_info_view.dart';

final class ReservationView extends StatefulWidget {
  const ReservationView({
    required this.parameters,
    super.key,
  });

  final Map<dynamic, dynamic> parameters;

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
                const Step(
                  title: Text('Araç Seçimi'),
                  content: SizedBox.shrink(),
                 
                ),
                Step(
                  title: const Text('Sürücü Bilgileri'),
                  content: DriverInfoView(
                    onRentButtonPressed: () {
                      setState(() {
                        currentStep = 2;
                      });
                    },
                    endDateWithTime: endDateWithTime,
                    startDateWithTime: startDateWithTime,
                    dayCount: dayCount,
                    endDate: endDate,
                    startDate: startDate,
                    car: car,
                  ),
                  isActive: currentStep == 1,
                ),
                Step(
                  title: const Text('Ödeme'),
                  content: PaymentView(
                    parameters: widget.parameters,
                  ),
                  isActive: currentStep == 2,
                ),
              ],
              onStepTapped: (value) {
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
