import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'create_dealership_request.g.dart';

@JsonSerializable()
final class CreateDealerShipRequest
    extends INetworkModel<CreateDealerShipRequest> with EquatableMixin {
  CreateDealerShipRequest({
    this.name,
    this.address,
    this.phone,
  });

  factory CreateDealerShipRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateDealerShipRequestFromJson(json);
  final String? name;
  final String? address;
  final String? phone;

  @override
  CreateDealerShipRequest fromJson(Map<String, dynamic> json) =>
      CreateDealerShipRequest.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$CreateDealerShipRequestToJson(this);

  @override
  List<Object?> get props => [name, address, phone];

  CreateDealerShipRequest copyWith({
    String? name,
    String? address,
    String? phone,
  }) {
    return CreateDealerShipRequest(
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
    );
  }
}
