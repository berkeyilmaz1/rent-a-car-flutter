import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'create_payment_request.g.dart';

@JsonSerializable()
final class PaymentCreateRequest extends INetworkModel<PaymentCreateRequest>
    with EquatableMixin {
  PaymentCreateRequest({
    this.reservationId,
    this.amount,
    this.paymentMethod,
    this.paymentDate,
    this.paymentStatus,
  });

  factory PaymentCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentCreateRequestFromJson(json);
  final int? reservationId;
  final int? amount;
  final int? paymentMethod;
  final DateTime? paymentDate;
  final int? paymentStatus;

  @override
  PaymentCreateRequest fromJson(Map<String, dynamic> json) =>
      PaymentCreateRequest.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$PaymentCreateRequestToJson(this);

  @override
  List<Object?> get props =>
      [reservationId, amount, paymentMethod, paymentDate, paymentStatus];

  PaymentCreateRequest copyWith({
    int? reservationId,
    int? amount,
    int? paymentMethod,
    DateTime? paymentDate,
    int? paymentStatus,
  }) {
    return PaymentCreateRequest(
      reservationId: reservationId ?? this.reservationId,
      amount: amount ?? this.amount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentDate: paymentDate ?? this.paymentDate,
      paymentStatus: paymentStatus ?? this.paymentStatus,
    );
  }
}
