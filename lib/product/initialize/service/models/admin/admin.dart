import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'admin.g.dart';

@JsonSerializable()
final class Admin extends INetworkModel<Admin> with EquatableMixin {
  Admin({
    this.id,
    this.name,
    this.lastname,
    this.email,
    this.password,
    this.createdAt,
    this.updatedAt,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => _$AdminFromJson(json);
  final String? id;
  final String? name;
  final String? lastname;
  final String? email;
  final String? password;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  Admin fromJson(Map<String, dynamic> json) => Admin.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$AdminToJson(this);

  @override
  List<Object?> get props =>
      [id, name, lastname, email, password, createdAt, updatedAt];

  Admin copyWith({
    String? id,
    String? name,
    String? lastname,
    String? email,
    String? password,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Admin(
      id: id ?? this.id,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      password: password ?? this.password,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
