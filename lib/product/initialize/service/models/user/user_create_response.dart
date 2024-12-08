import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_create_response.g.dart';

@JsonSerializable()
final class UserCreateResponse extends INetworkModel<UserCreateResponse>
    with EquatableMixin {
  UserCreateResponse({
    this.name,
    this.lastname,
    this.birthDate,
    this.email,
    this.password,
    this.phoneNumber,
    this.licenseNumber,
    this.address,
  });

  factory UserCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$UserCreateResponseFromJson(json);
  final String? name;
  final String? lastname;
  final DateTime? birthDate;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final String? licenseNumber;
  final String? address;

  @override
  UserCreateResponse fromJson(Map<String, dynamic> json) =>
      UserCreateResponse.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$UserCreateResponseToJson(this);

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

  UserCreateResponse copyWith({
    String? name,
    String? lastname,
    DateTime? birthDate,
    String? email,
    String? password,
    String? phoneNumber,
    String? licenseNumber,
    String? address,
  }) {
    return UserCreateResponse(
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
