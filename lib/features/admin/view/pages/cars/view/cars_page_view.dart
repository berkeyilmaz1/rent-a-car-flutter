import 'package:flutter/material.dart';
import 'package:rent_a_car/features/admin/view/pages/cars/view/cars_page_mixin.dart';
import 'package:rent_a_car/features/admin/view/pages/cars/widgets/admin_car_card.dart';
import 'package:rent_a_car/product/initialize/service/models/car/update_car_request.dart';

class CarsPageView extends StatefulWidget {
  const CarsPageView({super.key});

  @override
  State<CarsPageView> createState() => _CarsPageViewState();
}

class _CarsPageViewState extends State<CarsPageView> with CarsPageMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cars?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              if (cars == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return AdminCarCard(
                 
                car: cars![index],
                imageUrl: 'assets/images/fiat-egea.png',
              );
            },
          ),
        ),
      ],
    );
  }
}
