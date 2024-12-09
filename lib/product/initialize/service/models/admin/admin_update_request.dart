import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'admin_update_request.g.dart';

@JsonSerializable()
final class AdminUpdateRequest extends INetworkModel<AdminUpdateRequest>
    with EquatableMixin {
  AdminUpdateRequest({
    this.name,
    this.lastname,
    this.email,
    this.password,
  });

  factory AdminUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdateRequestFromJson(json);
  final String? name;
  final String? lastname;
  final String? email;
  final String? password;

  @override
  AdminUpdateRequest fromJson(Map<String, dynamic> json) =>
      AdminUpdateRequest.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$AdminUpdateRequestToJson(this);

  @override
  List<Object?> get props => [name, lastname, email, password];

  AdminUpdateRequest copyWith({
    String? name,
    String? lastname,
    String? email,
    String? password,
  }) {
    return AdminUpdateRequest(
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
