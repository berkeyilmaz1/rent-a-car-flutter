class Car {
  final String vinNumber;
  final String brand;
  final String model;
  final int year;
  final int fuelType;
  final int gearType;
  final String licensePlate;
  final int seatCount;
  final double pricePerDay;
  final bool availabilityStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int minAge;
  final int kilometer;
  final int dealershipId;

  final Dealership? dealership;
  final List<Deleted> deleteds;
  final FuelType? fuelTypeNavigation;
  final GearType? gearTypeNavigation;
  final List<Reservation> reservations;

  Car({
    required this.vinNumber,
    required this.brand,
    required this.model,
    required this.year,
    required this.fuelType,
    required this.gearType,
    required this.licensePlate,
    required this.seatCount,
    required this.pricePerDay,
    required this.availabilityStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.minAge,
    required this.kilometer,
    required this.dealershipId,
    this.dealership,
    this.deleteds = const [],
    this.fuelTypeNavigation,
    this.gearTypeNavigation,
    this.reservations = const [],
  });

  /// JSON'dan model dönüşümü
  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      vinNumber: json['vinNumber'] as String,
      brand: json['brand'] as String,
      model: json['model'] as String,
      year: json['year'] as int,
      fuelType: json['fuelType'] as int,
      gearType: json['gearType'] as int,
      licensePlate: json['licensePlate'] as String,
      seatCount: json['seatCount'] as int,
      pricePerDay: (json['pricePerDay'] as num).toDouble(),
      availabilityStatus: json['availabilityStatus'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      minAge: json['minAge'] as int,
      kilometer: json['kilometer'] as int,
      dealershipId: json['dealershipId'] as int,
      dealership: json['dealership'] != null
          ? Dealership.fromJson(json['dealership'])
          : null,
      deleteds: (json['deleteds'] as List<dynamic>?)
              ?.map((e) => Deleted.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      fuelTypeNavigation: json['fuelTypeNavigation'] != null
          ? FuelType.fromJson(json['fuelTypeNavigation'])
          : null,
      gearTypeNavigation: json['gearTypeNavigation'] != null
          ? GearType.fromJson(json['gearTypeNavigation'])
          : null,
      reservations: (json['reservations'] as List<dynamic>?)
              ?.map((e) => Reservation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  /// Modelden JSON'a dönüşüm
  Map<String, dynamic> toJson() {
    return {
      'vinNumber': vinNumber,
      'brand': brand,
      'model': model,
      'year': year,
      'fuelType': fuelType,
      'gearType': gearType,
      'licensePlate': licensePlate,
      'seatCount': seatCount,
      'pricePerDay': pricePerDay,
      'availabilityStatus': availabilityStatus,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'minAge': minAge,
      'kilometer': kilometer,
      'dealershipId': dealershipId,
      'dealership': dealership?.toJson(),
      'deleteds': deleteds.map((e) => e.toJson()).toList(),
      'fuelTypeNavigation': fuelTypeNavigation?.toJson(),
      'gearTypeNavigation': gearTypeNavigation?.toJson(),
      'reservations': reservations.map((e) => e.toJson()).toList(),
    };
  }
}

/// Diğer modeller (örnek)
class Dealership {
  final int id;
  final String name;

  Dealership({required this.id, required this.name});

  factory Dealership.fromJson(Map<String, dynamic> json) {
    return Dealership(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class Deleted {
  final int id;

  Deleted({required this.id});

  factory Deleted.fromJson(Map<String, dynamic> json) {
    return Deleted(
      id: json['id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}

class FuelType {
  final int id;
  final String name;

  FuelType({required this.id, required this.name});

  factory FuelType.fromJson(Map<String, dynamic> json) {
    return FuelType(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class GearType {
  final int id;
  final String name;

  GearType({required this.id, required this.name});

  factory GearType.fromJson(Map<String, dynamic> json) {
    return GearType(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class Reservation {
  final int id;

  Reservation({required this.id});

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
