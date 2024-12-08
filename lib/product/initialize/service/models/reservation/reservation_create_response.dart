import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'reservation_create_response.g.dart';

@JsonSerializable()
final class ReservationCreateResponse
    extends INetworkModel<ReservationCreateResponse> with EquatableMixin {
  ReservationCreateResponse({
    this.userId,
    this.carId,
    this.startDate,
    this.endDate,
    this.totalPrice,
    this.status,
  });

  factory ReservationCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$ReservationCreateResponseFromJson(json);
  final String? userId;
  final String? carId;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? totalPrice;
  final int? status;

  @override
  ReservationCreateResponse fromJson(Map<String, dynamic> json) =>
      ReservationCreateResponse.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ReservationCreateResponseToJson(this);

  @override
  List<Object?> get props =>
      [userId, carId, startDate, endDate, totalPrice, status];

  ReservationCreateResponse copyWith({
    String? userId,
    String? carId,
    DateTime? startDate,
    DateTime? endDate,
    int? totalPrice,
    int? status,
  }) {
    return ReservationCreateResponse(
      userId: userId ?? this.userId,
      carId: carId ?? this.carId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      totalPrice: totalPrice ?? this.totalPrice,
      status: status ?? this.status,
    );
  }
}
