import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'update_car_request.g.dart';

@JsonSerializable()
final class UpdateCarRequest extends INetworkModel<UpdateCarRequest>
    with EquatableMixin {
  UpdateCarRequest({
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

  factory UpdateCarRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateCarRequestFromJson(json);
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
  UpdateCarRequest fromJson(Map<String, dynamic> json) =>
      UpdateCarRequest.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$UpdateCarRequestToJson(this);

  @override
  List<Object?> get props => [
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

  UpdateCarRequest copyWith({
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
    return UpdateCarRequest(
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
