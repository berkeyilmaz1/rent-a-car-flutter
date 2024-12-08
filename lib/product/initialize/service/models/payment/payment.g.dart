// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      id: (json['id'] as num?)?.toInt(),
      reservationId: (json['reservationId'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
      paymentMethod: (json['paymentMethod'] as num?)?.toInt(),
      paymentDate: json['paymentDate'] as String?,
      paymentStatus: (json['paymentStatus'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      reservation: json['reservation'] == null
          ? null
          : Reservation.fromJson(json['reservation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'id': instance.id,
      'reservationId': instance.reservationId,
      'amount': instance.amount,
      'paymentMethod': instance.paymentMethod,
      'paymentDate': instance.paymentDate,
      'paymentStatus': instance.paymentStatus,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'reservation': instance.reservation,
    };
