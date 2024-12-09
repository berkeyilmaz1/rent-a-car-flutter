// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentCreateRequest _$PaymentCreateRequestFromJson(
        Map<String, dynamic> json) =>
    PaymentCreateRequest(
      reservationId: (json['reservationId'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
      paymentMethod: (json['paymentMethod'] as num?)?.toInt(),
      paymentDate: json['paymentDate'] == null
          ? null
          : DateTime.parse(json['paymentDate'] as String),
      paymentStatus: (json['paymentStatus'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaymentCreateRequestToJson(
        PaymentCreateRequest instance) =>
    <String, dynamic>{
      'reservationId': instance.reservationId,
      'amount': instance.amount,
      'paymentMethod': instance.paymentMethod,
      'paymentDate': instance.paymentDate?.toIso8601String(),
      'paymentStatus': instance.paymentStatus,
    };
