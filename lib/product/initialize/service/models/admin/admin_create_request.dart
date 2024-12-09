import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'admin_create_request.g.dart';

@JsonSerializable()
final class AdminCreateRequest extends INetworkModel<AdminCreateRequest>
    with EquatableMixin {
  AdminCreateRequest({
    this.id,
    this.name,
    this.lastname,
    this.email,
    this.password,
  });
  factory AdminCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateRequestFromJson(json);
  final String? id;
  final String? name;
  final String? lastname;
  final String? email;
  final String? password;

  @override
  AdminCreateRequest fromJson(Map<String, dynamic> json) =>
      AdminCreateRequest.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$AdminCreateRequestToJson(this);

  @override
  List<Object?> get props => [id, name, lastname, email, password];

  AdminCreateRequest copyWith({
    String? id,
    String? name,
    String? lastname,
    String? email,
    String? password,
  }) {
    return AdminCreateRequest(
      id: id ?? this.id,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
