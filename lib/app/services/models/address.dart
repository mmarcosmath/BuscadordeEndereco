import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class AddressModel {
  String cep;
  String address_type;
  String address_name;
  String address;
  String state;
  String district;
  String city;
  String ddd;
  int status;

  AddressModel({
    this.cep,
    this.address_type,
    this.address_name,
    this.address,
    this.state,
    this.district,
    this.city,
    this.ddd,
    this.status,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
