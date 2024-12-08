// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminCreateResponse _$AdminCreateResponseFromJson(Map<String, dynamic> json) =>
    AdminCreateResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$AdminCreateResponseToJson(
        AdminCreateResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastname': instance.lastname,
      'email': instance.email,
      'password': instance.password,
    };
