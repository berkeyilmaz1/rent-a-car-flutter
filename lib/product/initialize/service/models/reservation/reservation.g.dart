// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reservation _$ReservationFromJson(Map<String, dynamic> json) => Reservation(
      id: (json['id'] as num?)?.toInt(),
      userId: json['userId'] as String?,
      carId: json['carId'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      totalPrice: (json['totalPrice'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      createdDate: json['createdDate'] as String?,
      updatedDate: json['updatedDate'] as String?,
      car: json['car'] == null
          ? null
          : Car.fromJson(json['car'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReservationToJson(Reservation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'carId': instance.carId,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'totalPrice': instance.totalPrice,
      'status': instance.status,
      'createdDate': instance.createdDate,
      'updatedDate': instance.updatedDate,
      'car': instance.car,
    };
