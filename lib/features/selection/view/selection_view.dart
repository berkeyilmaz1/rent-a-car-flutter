import 'package:flutter/material.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/features/selection/view/mixin/selection_view_mixin.dart';
import 'package:rent_a_car/features/selection/widgets/dealership_dropdown/dealership_dropdown.dart';
import 'package:rent_a_car/product/initialize/router/route_tree.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

part '../widgets/selection_card.dart';

final class SelectionView extends StatefulWidget {
  const SelectionView({super.key});

  @override
  State<SelectionView> createState() => _SelectionViewState();
}

class _SelectionViewState extends State<SelectionView> with SelectionViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: Image.asset(
                'assets/images/car3.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const PagePadding.horizontalHighSymmetric(),
            child: Center(
              child: SelectionCard(
                dayCount: dayCount,
                onPressed: selectDate,
                formattedStartDate: formattedStartDate,
                formattedEndDate: formattedEndDate,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
