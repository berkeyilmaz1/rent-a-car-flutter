// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_dealership_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateDealerShipRequest _$CreateDealerShipRequestFromJson(
        Map<String, dynamic> json) =>
    CreateDealerShipRequest(
      name: json['name'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$CreateDealerShipRequestToJson(
        CreateDealerShipRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
    };
