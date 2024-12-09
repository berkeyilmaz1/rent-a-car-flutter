// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminUpdateRequest _$AdminUpdateRequestFromJson(Map<String, dynamic> json) =>
    AdminUpdateRequest(
      name: json['name'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$AdminUpdateRequestToJson(AdminUpdateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lastname': instance.lastname,
      'email': instance.email,
      'password': instance.password,
    };
