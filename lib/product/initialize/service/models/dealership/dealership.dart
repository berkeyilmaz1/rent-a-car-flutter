import 'package:json_annotation/json_annotation.dart';
import 'package:rent_a_car/product/initialize/service/models/car/car.dart';
import 'package:vexana/vexana.dart';

part 'dealership.g.dart';

@JsonSerializable()
final class DealerShip extends INetworkModel<DealerShip> {

  const DealerShip({
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
  final List<Car>? cars;

  @override
  DealerShip fromJson(Map<String, dynamic> json) => DealerShip.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$DealerShipToJson(this);

  DealerShip copyWith({
    int? id,
    String? name,
    String? address,
    String? phone,
    List<Car>? cars,
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
