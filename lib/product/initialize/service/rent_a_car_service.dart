import 'package:rent_a_car/core/model/base_error_model.dart';
import 'package:rent_a_car/product/initialize/service/enum/service_paths.dart';
import 'package:rent_a_car/product/initialize/service/models/car/car.dart';
import 'package:rent_a_car/product/initialize/service/models/car/update_car_request.dart';
import 'package:rent_a_car/product/initialize/service/models/dealership/dealership.dart';
import 'package:vexana/vexana.dart';

abstract class RentACarServiceInterface {
  RentACarServiceInterface({
    required INetworkManager<BaseErrorModel> networkManager,
  }) : _networkManager = networkManager;

  /// This is a network manager
  final INetworkManager<BaseErrorModel> _networkManager;

  Future<List<Car>?> getAllCars();
  Future<List<DealerShip>?> getAllDealership();
  Future<EmptyModel?> updateCar(UpdateCarRequest car, String vinNumber);
  Future<EmptyModel?> deleteCar(String vinNumber);
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

  @override
  Future<List<DealerShip>?> getAllDealership() async {
    final response = await _networkManager.send<DealerShip, List<DealerShip>>(
      ServicePaths.listAllDealership,
      parseModel: DealerShip(),
      method: RequestType.GET,
    );
    return response.data;
  }

  @override
  Future<EmptyModel?> updateCar(UpdateCarRequest car, String vinNumber) async {
    final response = await _networkManager.send<EmptyModel, EmptyModel>(
      ServicePaths.carWithVIN(vinNumber),
      parseModel: const EmptyModel(),
      method: RequestType.PUT,
      data: car,
    );
    return response.data;
  }

  @override
  Future<EmptyModel?> deleteCar(String vinNumber) async {
    final response = await _networkManager.send<EmptyModel, EmptyModel>(
      ServicePaths.carWithVIN(vinNumber),
      parseModel: const EmptyModel(),
      method: RequestType.DELETE,
    );
    return response.data;
  }
}
