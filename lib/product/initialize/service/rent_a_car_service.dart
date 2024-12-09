import 'package:rent_a_car/core/model/base_error_model.dart';
import 'package:rent_a_car/product/initialize/service/enum/service_paths.dart';
import 'package:rent_a_car/product/initialize/service/models/admin/admin.dart';
import 'package:rent_a_car/product/initialize/service/models/admin/admin_create_request.dart';
import 'package:rent_a_car/product/initialize/service/models/admin/admin_update_request.dart';
import 'package:rent_a_car/product/initialize/service/models/car/car.dart';
import 'package:rent_a_car/product/initialize/service/models/car/create_car_request.dart';
import 'package:rent_a_car/product/initialize/service/models/car/update_car_request.dart';
import 'package:rent_a_car/product/initialize/service/models/dealership/create_dealership_request.dart';
import 'package:rent_a_car/product/initialize/service/models/dealership/dealership.dart';
import 'package:rent_a_car/product/initialize/service/models/payment/create_payment_request.dart';
import 'package:rent_a_car/product/initialize/service/models/payment/payment.dart';
import 'package:rent_a_car/product/initialize/service/models/reservation/reservation.dart';
import 'package:rent_a_car/product/initialize/service/models/reservation/reservation_create_request.dart';
import 'package:rent_a_car/product/initialize/service/models/user/user.dart';
import 'package:rent_a_car/product/initialize/service/models/user/user_create_request.dart';
import 'package:vexana/vexana.dart';

abstract class RentACarServiceInterface {
  RentACarServiceInterface({
    required INetworkManager<BaseErrorModel> networkManager,
  }) : _networkManager = networkManager;

  /// This is a network manager
  final INetworkManager<BaseErrorModel> _networkManager;

  Future<List<Car>?> getAllCars();
  Future<EmptyModel?> updateCar(UpdateCarRequest car, String vinNumber);
  Future<EmptyModel?> deleteCar(String vinNumber);
  Future<EmptyModel?> createCar(CreateCarRequest car);

  Future<List<DealerShip>?> getAllDealership();
  Future<EmptyModel?> deleteDealerShip(int id);
  Future<EmptyModel?> createDealerShip(CreateDealerShipRequest dealerShip);
  Future<EmptyModel?> updateDealerShip(
    CreateDealerShipRequest dealerShip,
    int id,
  );

  Future<List<Reservation>?> getAllReservations();
  Future<EmptyModel?> deleteReservation(int id);
  Future<EmptyModel?> createReservation(ReservationCreateRequest reservation);
  Future<EmptyModel?> updateReservation(
    ReservationCreateRequest reservation,
    int id,
  );

  Future<List<User>?> getAllUsers();
  Future<EmptyModel?> deleteUser(String id);
  Future<EmptyModel?> createUser(UserCreateRequest user);
  Future<EmptyModel?> updateUser(User user, String id);
  Future<User?> getUser(String id);

  Future<List<Admin>?> getAllAdmins();
  Future<EmptyModel?> deleteAdmin(String id);
  Future<EmptyModel?> createAdmin(AdminCreateRequest admin);
  Future<EmptyModel?> updateAdmin(AdminUpdateRequest admin, String id);
  Future<Admin?> getAdmin(String id);

  Future<List<Payment>?> getAllPayments();
  Future<EmptyModel?> deletePayment(int id);
  Future<EmptyModel?> createPayment(PaymentCreateRequest payment);
  Future<EmptyModel?> updatePayment(PaymentCreateRequest payment, int id);
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
  Future<EmptyModel?> createCar(CreateCarRequest car) async {
    final response = await _networkManager.send<EmptyModel, EmptyModel>(
      ServicePaths.listAllCars,
      parseModel: const EmptyModel(),
      method: RequestType.POST,
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
  Future<EmptyModel?> deleteDealerShip(int id) async {
    final response = await _networkManager.send<EmptyModel, EmptyModel>(
      ServicePaths.dealershipWithId(id.toString()),
      parseModel: const EmptyModel(),
      method: RequestType.DELETE,
    );
    return response.data;
  }

  @override
  Future<List<Reservation>?> getAllReservations() async {
    final response = await _networkManager.send<Reservation, List<Reservation>>(
      ServicePaths.reservations,
      parseModel: Reservation(),
      method: RequestType.GET,
    );
    return response.data;
  }

  @override
  Future<EmptyModel?> createReservation(
    ReservationCreateRequest reservation,
  ) async {
    final response = await _networkManager.send<EmptyModel, EmptyModel>(
      ServicePaths.reservations,
      parseModel: const EmptyModel(),
      method: RequestType.POST,
      data: reservation,
    );
    return response.data;
  }

  @override
  Future<EmptyModel?> deleteReservation(int id) async {
    final response = await _networkManager.send<EmptyModel, EmptyModel>(
      ServicePaths.reservationsWithId(id.toString()),
      parseModel: const EmptyModel(),
      method: RequestType.DELETE,
    );
    return response.data;
  }

  @override
  Future<EmptyModel?> createDealerShip(
    CreateDealerShipRequest dealerShip,
  ) async {
    final response = await _networkManager.send<EmptyModel, EmptyModel>(
      ServicePaths.listAllDealership,
      parseModel: const EmptyModel(),
      method: RequestType.POST,
      data: dealerShip,
    );
    return response.data;
  }

  @override
  Future<EmptyModel?> updateDealerShip(
    CreateDealerShipRequest dealerShip,
    int id,
  ) async {
    final response = await _networkManager.send<EmptyModel, EmptyModel>(
      ServicePaths.dealershipWithId(id.toString()),
      parseModel: const EmptyModel(),
      method: RequestType.PUT,
      data: dealerShip,
    );
    return response.data;
  }

  @override
  Future<EmptyModel?> updateReservation(
    ReservationCreateRequest reservation,
    int id,
  ) async {
    final response = await _networkManager.send<EmptyModel, EmptyModel>(
      ServicePaths.reservationsWithId(id.toString()),
      parseModel: const EmptyModel(),
      method: RequestType.PUT,
      data: reservation,
    );
    return response.data;
  }

  @override
  Future<EmptyModel?> createUser(UserCreateRequest user) async {
    final response = await _networkManager.send<EmptyModel, EmptyModel>(
      ServicePaths.users,
      parseModel: const EmptyModel(),
      method: RequestType.POST,
      data: user,
    );
    return response.data;
  }

  @override
  Future<EmptyModel?> deleteUser(String id) async {
    final response = await _networkManager.send<EmptyModel, EmptyModel>(
      ServicePaths.userWithId(id),
      parseModel: const EmptyModel(),
      method: RequestType.DELETE,
    );
    return response.data;
  }

  @override
  Future<List<User>?> getAllUsers() async {
    final response = await _networkManager.send<User, List<User>>(
      ServicePaths.users,
      parseModel: User(),
      method: RequestType.GET,
    );
    return response.data;
  }

  @override
  Future<User?> getUser(String id) async {
    final response = await _networkManager.send<User, User>(
      ServicePaths.userWithId(id),
      parseModel: User(),
      method: RequestType.GET,
    );
    return response.data;
  }

  @override
  Future<EmptyModel?> updateUser(User user, String id) async {
    final response = await _networkManager.send<EmptyModel, EmptyModel>(
      ServicePaths.userWithId(id),
      parseModel: const EmptyModel(),
      method: RequestType.PUT,
      data: user,
    );
    return response.data;
  }

  @override
  Future<EmptyModel?> createAdmin(AdminCreateRequest admin) async {
    final response = await _networkManager.send<EmptyModel, EmptyModel>(
      ServicePaths.admins,
      parseModel: const EmptyModel(),
      method: RequestType.POST,
      data: admin,
    );
    return response.data;
  }

  @override
  Future<EmptyModel?> deleteAdmin(String id) async {
    final response = await _networkManager.send<EmptyModel, EmptyModel>(
      ServicePaths.adminsWithId(id),
      parseModel: const EmptyModel(),
      method: RequestType.DELETE,
    );
    return response.data;
  }

  @override
  Future<Admin?> getAdmin(String id) async {
    final response = await _networkManager.send<Admin, Admin>(
      ServicePaths.adminsWithId(id),
      parseModel: Admin(),
      method: RequestType.GET,
    );
    return response.data;
  }

  @override
  Future<List<Admin>?> getAllAdmins() async {
    final response = await _networkManager.send<Admin, List<Admin>>(
      ServicePaths.admins,
      parseModel: Admin(),
      method: RequestType.GET,
    );
    return response.data;
  }

  @override
  Future<EmptyModel?> updateAdmin(AdminUpdateRequest admin, String id) async {
    final response = await _networkManager.send<EmptyModel, EmptyModel>(
      ServicePaths.adminsWithId(id),
      parseModel: const EmptyModel(),
      method: RequestType.PUT,
      data: admin,
    );
    return response.data;
  }

  @override
  Future<EmptyModel?> createPayment(PaymentCreateRequest payment) async {
    final response = await _networkManager.send<EmptyModel, EmptyModel>(
      ServicePaths.payments,
      parseModel: const EmptyModel(),
      method: RequestType.POST,
      data: payment,
    );
    return response.data;
  }

  @override
  Future<EmptyModel?> deletePayment(int id) async {
    final response = await _networkManager.send<EmptyModel, EmptyModel>(
      ServicePaths.paymentsWithId(id.toString()),
      parseModel: const EmptyModel(),
      method: RequestType.DELETE,
    );
    return response.data;
  }

  @override
  Future<List<Payment>?> getAllPayments() async {
    final response = await _networkManager.send<Payment, List<Payment>>(
      ServicePaths.payments,
      parseModel: Payment(),
      method: RequestType.GET,
    );
    return response.data;
  }

  @override
  Future<EmptyModel?> updatePayment(
      PaymentCreateRequest payment, int id) async {
    final response = await _networkManager.send<EmptyModel, EmptyModel>(
      ServicePaths.paymentsWithId(id.toString()),
      parseModel: const EmptyModel(),
      method: RequestType.PUT,
      data: payment,
    );
    return response.data;
  }
}
