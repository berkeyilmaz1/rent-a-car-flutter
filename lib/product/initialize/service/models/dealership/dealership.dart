import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rent_a_car/product/initialize/service/models/car/car.dart';
import 'package:vexana/vexana.dart';

part 'dealership.g.dart';

@JsonSerializable()
final class DealerShip extends INetworkModel<DealerShip> with EquatableMixin {
  DealerShip({
    this.id,
    this.name,
    this.address,
    this.phone,
    this.cars,
  });

  factory DealerShip.fromJson(Map<String, dynamic> json) =>
      _$DealerShipFromJson(json);
  final int? id;
  final String? name;
  final String? address;
  final String? phone;
  final Car? cars;

  @override
  DealerShip fromJson(Map<String, dynamic> json) => DealerShip.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$DealerShipToJson(this);

  @override
  List<Object?> get props => [id, name, address, phone, cars];

  DealerShip copyWith({
    int? id,
    String? name,
    String? address,
    String? phone,
    Car? cars,
  }) {
    return DealerShip(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      cars: cars ?? this.cars,
    );
  }
}
