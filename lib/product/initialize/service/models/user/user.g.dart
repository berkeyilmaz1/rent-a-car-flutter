// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
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
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastname': instance.lastname,
      'birthDate': instance.birthDate?.toIso8601String(),
      'email': instance.email,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'licenseNumber': instance.licenseNumber,
      'address': instance.address,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
