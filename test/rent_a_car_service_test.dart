import 'package:flutter_test/flutter_test.dart';
import 'package:rent_a_car/core/model/base_error_model.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';
import 'package:vexana/vexana.dart';

void main() {
  final NetworkManager<BaseErrorModel> networkManager = ProductNetworkManager();

  final rentACarService = RentACarService(networkManager: networkManager);

  test('Get all Dealerships', () async {
    final response = await rentACarService.getAllDealership();

    expect(response, isNotNull);
  });
}
