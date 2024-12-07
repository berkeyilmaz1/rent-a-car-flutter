final class ServicePaths {
  ServicePaths._();

  static const String listAllCars = 'api/cars';
  static const String listAllDealership = 'api/dealerships';

  ///vin is VIN Number of the car
  static String carWithVIN(String vin) => 'api/cars/$vin';
}
