import 'package:flutter/material.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/features/admin/view/pages/dealerships/view/dealership_page_view.dart';
import 'package:rent_a_car/product/initialize/router/route_tree.dart';
import 'package:rent_a_car/product/initialize/service/models/dealership/create_dealership_request.dart';
import 'package:rent_a_car/product/initialize/service/models/dealership/dealership.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';

mixin DealershipPageMixin on State<DealerShipPageView> {
  late final RentACarService _rentACarService;
  List<DealerShip>? dealers;
  @override
  void initState() {
    super.initState();

    _rentACarService = RentACarService(
      networkManager: ProductNetworkManager(),
    );

    fetchDealers();
  }

  Future<void> saveOnPressed(CreateDealerShipRequest dealer, int id) async {
    await _rentACarService.updateDealerShip(dealer, id);
  }

  Future<void> deleteOnPressed(int id) async {
    await _rentACarService.deleteDealerShip(id);
  }

  void navigateToCreateDealer() {
    CreateDealerRoute().go(context);
  }

  Future<void> fetchDealers() async {
    final response = await _rentACarService.getAllDealership();
    setState(() {
      dealers = response;
    });
  }
}
