// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return AddressModel(
    cep: json['cep'] as String,
    address_type: json['address_type'] as String,
    address_name: json['address_name'] as String,
    address: json['address'] as String,
    state: json['state'] as String,
    district: json['district'] as String,
    city: json['city'] as String,
    ddd: json['ddd'] as String,
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'cep': instance.cep,
      'address_type': instance.address_type,
      'address_name': instance.address_name,
      'address': instance.address,
      'state': instance.state,
      'district': instance.district,
      'city': instance.city,
      'ddd': instance.ddd,
      'status': instance.status,
    };
