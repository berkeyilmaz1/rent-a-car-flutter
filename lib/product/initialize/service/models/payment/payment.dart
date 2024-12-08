import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rent_a_car/product/initialize/service/models/reservation/reservation.dart';
import 'package:vexana/vexana.dart';

part 'payment.g.dart';

@JsonSerializable()
final class Payment extends INetworkModel<Payment> with EquatableMixin {
  Payment({
    this.id,
    this.reservationId,
    this.amount,
    this.paymentMethod,
    this.paymentDate,
    this.paymentStatus,
    this.createdAt,
    this.updatedAt,
    this.reservation,
  });

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
  final int? id;
  final int? reservationId;
  final int? amount;
  final int? paymentMethod;
  final String? paymentDate;
  final int? paymentStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Reservation? reservation;

  @override
  Payment fromJson(Map<String, dynamic> json) => Payment.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$PaymentToJson(this);

  @override
  List<Object?> get props => [
        id,
        reservationId,
        amount,
        paymentMethod,
        paymentDate,
        paymentStatus,
        createdAt,
        updatedAt,
        reservation,
      ];

  Payment copyWith({
    int? id,
    int? reservationId,
    int? amount,
    int? paymentMethod,
    String? paymentDate,
    int? paymentStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
    Reservation? reservation,
  }) {
    return Payment(
      id: id ?? this.id,
      reservationId: reservationId ?? this.reservationId,
      amount: amount ?? this.amount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentDate: paymentDate ?? this.paymentDate,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      reservation: reservation ?? this.reservation,
    );
  }
}
