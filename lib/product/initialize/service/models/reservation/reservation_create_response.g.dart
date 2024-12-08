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
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      totalPrice: (json['totalPrice'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReservationCreateResponseToJson(
        ReservationCreateResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'carId': instance.carId,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'totalPrice': instance.totalPrice,
      'status': instance.status,
    };
