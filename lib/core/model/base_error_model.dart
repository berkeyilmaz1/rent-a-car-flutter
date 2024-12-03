import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'base_error_model.g.dart';

@JsonSerializable()
final class BaseErrorModel extends INetworkModel<BaseErrorModel> {
  const BaseErrorModel({required this.message});

  final String? message;

  @override
  BaseErrorModel fromJson(Map<String, dynamic> json) {
    return _$BaseErrorModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() => _$BaseErrorModelToJson(this);
}