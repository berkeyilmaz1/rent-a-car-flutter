import 'package:rent_a_car/core/model/base_error_model.dart';
import 'package:rent_a_car/product/initialize/service/enum/service_paths.dart';
import 'package:rent_a_car/product/initialize/service/models/car/car.dart';
import 'package:vexana/vexana.dart';

abstract class RentACarServiceInterface {
  RentACarServiceInterface({
    required INetworkManager<BaseErrorModel> networkManager,
  }) : _networkManager = networkManager;

  /// This is a network manager
  final INetworkManager<BaseErrorModel> _networkManager;

  Future<List<Car>?> getAllCars();
}

final class RentACarService extends RentACarServiceInterface {
  RentACarService({required super.networkManager});

  @override
  Future<List<Car>?> getAllCars() async {
    final response = await _networkManager.send<Car, List<Car>>(
      ServicePaths.listAllCars,
      parseModel: Car(),
      method: RequestType.GET,
    );

    return response.data;
  }
}
