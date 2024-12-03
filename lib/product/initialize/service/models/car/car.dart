import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'car.g.dart';

@JsonSerializable()
final class Car extends INetworkModel<Car> with EquatableMixin {
  Car({
    this.vinNumber,
    this.brand,
    this.model,
    this.year,
    this.fuelType,
    this.gearType,
    this.licensePlate,
    this.seatCount,
    this.pricePerDay,
    this.availabilityStatus,
    this.createdAt,
    this.updatedAt,
    this.minAge,
    this.kilometer,
    this.dealershipId,
  });

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);
  final String? vinNumber;
  final String? brand;
  final String? model;
  final int? year;
  final int? fuelType;
  final int? gearType;
  final String? licensePlate;
  final int? seatCount;
  final int? pricePerDay;
  final bool? availabilityStatus;
  final String? createdAt;

  ///todo
  final String? updatedAt;
  final int? minAge;
  final int? kilometer;
  final int? dealershipId;

  @override
  Car fromJson(Map<String, dynamic> json) => Car.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$CarToJson(this);

  @override
  List<Object?> get props => [
        vinNumber,
        brand,
        model,
        year,
        fuelType,
        gearType,
        licensePlate,
        seatCount,
        pricePerDay,
        availabilityStatus,
        createdAt,
        updatedAt,
        minAge,
        kilometer,
        dealershipId,
      ];

  Car copyWith({
    String? vinNumber,
    String? brand,
    String? model,
    int? year,
    int? fuelType,
    int? gearType,
    String? licensePlate,
    int? seatCount,
    int? pricePerDay,
    bool? availabilityStatus,
    String? createdAt,
    String? updatedAt,
    int? minAge,
    int? kilometer,
    int? dealershipId,
  }) {
    return Car(
      vinNumber: vinNumber ?? this.vinNumber,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      year: year ?? this.year,
      fuelType: fuelType ?? this.fuelType,
      gearType: gearType ?? this.gearType,
      licensePlate: licensePlate ?? this.licensePlate,
      seatCount: seatCount ?? this.seatCount,
      pricePerDay: pricePerDay ?? this.pricePerDay,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      minAge: minAge ?? this.minAge,
      kilometer: kilometer ?? this.kilometer,
      dealershipId: dealershipId ?? this.dealershipId,
    );
  }
}
