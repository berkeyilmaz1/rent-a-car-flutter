// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_create_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCreateResponse _$UserCreateResponseFromJson(Map<String, dynamic> json) =>
    UserCreateResponse(
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

Map<String, dynamic> _$UserCreateResponseToJson(UserCreateResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lastname': instance.lastname,
      'birthDate': instance.birthDate?.toIso8601String(),
      'email': instance.email,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'licenseNumber': instance.licenseNumber,
      'address': instance.address,
    };
