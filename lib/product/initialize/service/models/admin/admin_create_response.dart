import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'admin_create_response.g.dart';

@JsonSerializable()
final class AdminCreateResponse extends INetworkModel<AdminCreateResponse>
    with EquatableMixin {
  AdminCreateResponse({
    this.id,
    this.name,
    this.lastname,
    this.email,
    this.password,
  });

  factory AdminCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateResponseFromJson(json);
  final String? id;
  final String? name;
  final String? lastname;
  final String? email;
  final String? password;

  @override
  AdminCreateResponse fromJson(Map<String, dynamic> json) =>
      AdminCreateResponse.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$AdminCreateResponseToJson(this);

  @override
  List<Object?> get props => [id, name, lastname, email, password];

  AdminCreateResponse copyWith({
    String? id,
    String? name,
    String? lastname,
    String? email,
    String? password,
  }) {
    return AdminCreateResponse(
      id: id ?? this.id,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
