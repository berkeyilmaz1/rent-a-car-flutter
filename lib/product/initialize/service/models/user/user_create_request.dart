import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_create_request.g.dart';

@JsonSerializable()
final class UserCreateRequest extends INetworkModel<UserCreateRequest>
    with EquatableMixin {
  UserCreateRequest({
    this.name,
    this.lastname,
    this.birthDate,
    this.email,
    this.password,
    this.phoneNumber,
    this.licenseNumber,
    this.address,
  });

  factory UserCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$UserCreateRequestFromJson(json);
  final String? name;
  final String? lastname;
  final DateTime? birthDate;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final String? licenseNumber;
  final String? address;

  @override
  UserCreateRequest fromJson(Map<String, dynamic> json) =>
      UserCreateRequest.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$UserCreateRequestToJson(this);

  @override
  List<Object?> get props => [
        name,
        lastname,
        birthDate,
        email,
        password,
        phoneNumber,
        licenseNumber,
        address,
      ];

  UserCreateRequest copyWith({
    String? name,
    String? lastname,
    DateTime? birthDate,
    String? email,
    String? password,
    String? phoneNumber,
    String? licenseNumber,
    String? address,
  }) {
    return UserCreateRequest(
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      birthDate: birthDate ?? this.birthDate,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      licenseNumber: licenseNumber ?? this.licenseNumber,
      address: address ?? this.address,
    );
  }
}
