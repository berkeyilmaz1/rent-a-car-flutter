// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCreateRequest _$UserCreateRequestFromJson(Map<String, dynamic> json) =>
    UserCreateRequest(
      id: json['id'] as String?,
      name: json['name'] as String?,
      lastname: json['lastname'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      email: json['email'] as String?,
      password: json['password'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      licenseNumber: json['licenseNumber'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$UserCreateRequestToJson(UserCreateRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastname': instance.lastname,
      'birthDate': instance.birthDate?.toIso8601String(),
      'email': instance.email,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'licenseNumber': instance.licenseNumber,
      'address': instance.address,
    };
