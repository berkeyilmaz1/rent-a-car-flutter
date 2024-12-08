final class ServicePaths {
  ServicePaths._();

  static const String listAllCars = 'cars';
  static const String listAllDealership = 'dealerships';

  ///vin is VIN Number of the car
  static String carWithVIN(String vin) => 'cars/$vin';

  static const String reservations = 'reservations';
  static String reservationsWithId(String id) => 'reservations/$id';

  static String dealershipWithId(String id) => 'dealerships/$id';

  static String users = 'users';
  static String userWithId(String id) => 'users/$id';

  static String adminsWithId(String id) => 'admins/$id';
  static String admins = 'admins';
}
