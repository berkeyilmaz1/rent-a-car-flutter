import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'reservation_create_request.g.dart';

@JsonSerializable()
final class ReservationCreateRequest
    extends INetworkModel<ReservationCreateRequest> with EquatableMixin {
  ReservationCreateRequest({
    this.userId,
    this.carId,
    this.startDate,
    this.endDate,
    this.totalPrice,
    this.status,
  });

  factory ReservationCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$ReservationCreateRequestFromJson(json);
  final String? userId;
  final String? carId;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? totalPrice;
  final int? status;

  @override
  ReservationCreateRequest fromJson(Map<String, dynamic> json) =>
      ReservationCreateRequest.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ReservationCreateRequestToJson(this);

  @override
  List<Object?> get props =>
      [userId, carId, startDate, endDate, totalPrice, status];

  ReservationCreateRequest copyWith({
    String? userId,
    String? carId,
    DateTime? startDate,
    DateTime? endDate,
    int? totalPrice,
    int? status,
  }) {
    return ReservationCreateRequest(
      userId: userId ?? this.userId,
      carId: carId ?? this.carId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      totalPrice: totalPrice ?? this.totalPrice,
      status: status ?? this.status,
    );
  }
}
