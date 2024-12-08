// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_create_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationCreateResponse _$ReservationCreateResponseFromJson(
        Map<String, dynamic> json) =>
    ReservationCreateResponse(
      userId: json['userId'] as String?,
      carId: json['carId'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      totalPrice: (json['totalPrice'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReservationCreateResponseToJson(
        ReservationCreateResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'carId': instance.carId,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'totalPrice': instance.totalPrice,
      'status': instance.status,
    };
