// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_car_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCarRequest _$CreateCarRequestFromJson(Map<String, dynamic> json) =>
    CreateCarRequest(
      vinNumber: json['vinNumber'] as String?,
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      year: (json['year'] as num?)?.toInt(),
      fuelType: (json['fuelType'] as num?)?.toInt(),
      gearType: (json['gearType'] as num?)?.toInt(),
      licensePlate: json['licensePlate'] as String?,
      seatCount: (json['seatCount'] as num?)?.toInt(),
      pricePerDay: (json['pricePerDay'] as num?)?.toInt(),
      availabilityStatus: json['availabilityStatus'] as bool?,
      minAge: (json['minAge'] as num?)?.toInt(),
      kilometer: (json['kilometer'] as num?)?.toInt(),
      dealershipId: (json['dealershipId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CreateCarRequestToJson(CreateCarRequest instance) =>
    <String, dynamic>{
      'vinNumber': instance.vinNumber,
      'brand': instance.brand,
      'model': instance.model,
      'year': instance.year,
      'fuelType': instance.fuelType,
      'gearType': instance.gearType,
      'licensePlate': instance.licensePlate,
      'seatCount': instance.seatCount,
      'pricePerDay': instance.pricePerDay,
      'availabilityStatus': instance.availabilityStatus,
      'minAge': instance.minAge,
      'kilometer': instance.kilometer,
      'dealershipId': instance.dealershipId,
    };
