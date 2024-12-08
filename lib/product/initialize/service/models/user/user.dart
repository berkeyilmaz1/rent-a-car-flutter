import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rent_a_car/product/initialize/service/models/reservation/reservation.dart';
import 'package:vexana/vexana.dart';

part 'user.g.dart';

@JsonSerializable()
final class User extends INetworkModel<User> with EquatableMixin {
  User({
    this.id,
    this.name,
    this.lastname,
    this.birthDate,
    this.email,
    this.password,
    this.phoneNumber,
    this.licenseNumber,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.reservations,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  final String? id;
  final String? name;
  final String? lastname;
  final DateTime? birthDate;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final String? licenseNumber;
  final String? address;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Reservation? reservations;

  @override
  User fromJson(Map<String, dynamic> json) => User.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$UserToJson(this);

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
        address,
        createdAt,
        updatedAt,
        reservations,
      ];

  User copyWith({
    String? id,
    String? name,
    String? lastname,
    DateTime? birthDate,
    String? email,
    String? password,
    String? phoneNumber,
    String? licenseNumber,
    String? address,
    DateTime? createdAt,
    DateTime? updatedAt,
    Reservation? reservations,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      birthDate: birthDate ?? this.birthDate,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      licenseNumber: licenseNumber ?? this.licenseNumber,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      reservations: reservations ?? this.reservations,
    );
  }
}
