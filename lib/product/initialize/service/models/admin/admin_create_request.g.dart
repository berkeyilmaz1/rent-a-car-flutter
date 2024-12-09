// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminCreateRequest _$AdminCreateRequestFromJson(Map<String, dynamic> json) =>
    AdminCreateRequest(
      id: json['id'] as String?,
      name: json['name'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$AdminCreateRequestToJson(AdminCreateRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastname': instance.lastname,
      'email': instance.email,
      'password': instance.password,
    };
