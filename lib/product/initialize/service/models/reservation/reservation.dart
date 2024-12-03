import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rent_a_car/product/initialize/service/models/car/car.dart';
import 'package:vexana/vexana.dart';

part 'reservation.g.dart';

@JsonSerializable()
final class Reservation extends INetworkModel<Reservation> with EquatableMixin {
  Reservation({
    this.id,
    this.userId,
    this.carId,
    this.startDate,
    this.endDate,
    this.totalPrice,
    this.status,
    this.createdDate,
    this.updatedDate,
    this.car,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);
  final int? id;
  final String? userId;
  final String? carId;
  final String? startDate;
  final String? endDate;
  final int? totalPrice;
  final int? status;
  final String? createdDate;
  final String? updatedDate;
  final Car? car;

  @override
  Reservation fromJson(Map<String, dynamic> json) => Reservation.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ReservationToJson(this);

  @override
  List<Object?> get props => [
        id,
        userId,
        carId,
        startDate,
        endDate,
        totalPrice,
        status,
        createdDate,
        updatedDate,
        car,
      ];

  Reservation copyWith({
    int? id,
    String? userId,
    String? carId,
    String? startDate,
    String? endDate,
    int? totalPrice,
    int? status,
    String? createdDate,
    String? updatedDate,
    Car? car,
    void payments,
    void statusNavigation,
    void user,
  }) {
    return Reservation(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      carId: carId ?? this.carId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      totalPrice: totalPrice ?? this.totalPrice,
      status: status ?? this.status,
      createdDate: createdDate ?? this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
      car: car ?? this.car,
    );
  }
}
