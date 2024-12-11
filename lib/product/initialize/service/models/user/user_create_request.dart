import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_create_request.g.dart';

@JsonSerializable()
final class UserCreateRequest extends INetworkModel<UserCreateRequest>
    with EquatableMixin {
  final String? id;
  final String? name;
  final String? lastname;
  final DateTime? birthDate;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final String? licenseNumber;
  final String? address;

  UserCreateRequest({
    this.id,
    this.name,
    this.lastname,
    this.birthDate,
    this.email,
    this.password,
    this.phoneNumber,
    this.licenseNumber,
    this.address,
  });

  @override
  UserCreateRequest fromJson(Map<String, dynamic> json) =>
      UserCreateRequest.fromJson(json);

  factory UserCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$UserCreateRequestFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$UserCreateRequestToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        lastname,
        birthDate,
        email,
        password,
        phoneNumber,
        licenseNumber,
        address
      ];

  UserCreateRequest copyWith({
    String? id,
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
      id: id ?? this.id,
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
