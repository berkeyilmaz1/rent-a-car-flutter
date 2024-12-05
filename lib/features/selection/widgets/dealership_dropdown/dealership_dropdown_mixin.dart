import 'package:flutter/material.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/features/selection/widgets/dealership_dropdown/dealership_dropdown.dart';
import 'package:rent_a_car/product/initialize/service/models/dealership/dealership.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';

mixin DealershipDropdownMixin on State<DealershipDropdown> {
  late final RentACarService rentACarService;
  List<String?> dealership = [];
  DealerShip? initialValue;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    rentACarService = RentACarService(networkManager: ProductNetworkManager());
    _fetchAllItems();
  }

  Future<void> _fetchAllItems() async {
    final items = await rentACarService.getAllDealership();

    convertToName(items);
  }

  void convertToName(List<DealerShip>? dealers) {
    dealership = dealers
            ?.map(
              (e) => e.name,
            )
            .toList() ??
        [];
  }

  void onChanged(DealerShip? value) {
    if (value == null) return;
    setState(() {
      initialValue = value;
    });
    widget.onChanged(value);
  }
}
