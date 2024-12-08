import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'create_car_request.g.dart';

@JsonSerializable()
final class CreateCarRequest extends INetworkModel<CreateCarRequest>
    with EquatableMixin {
  CreateCarRequest({
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
    this.minAge,
    this.kilometer,
    this.dealershipId,
  });

  factory CreateCarRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCarRequestFromJson(json);
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
  final int? minAge;
  final int? kilometer;
  final int? dealershipId;

  @override
  CreateCarRequest fromJson(Map<String, dynamic> json) =>
      CreateCarRequest.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$CreateCarRequestToJson(this);

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
        minAge,
        kilometer,
        dealershipId,
      ];

  CreateCarRequest copyWith({
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
    int? minAge,
    int? kilometer,
    int? dealershipId,
  }) {
    return CreateCarRequest(
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
      minAge: minAge ?? this.minAge,
      kilometer: kilometer ?? this.kilometer,
      dealershipId: dealershipId ?? this.dealershipId,
    );
  }
}
