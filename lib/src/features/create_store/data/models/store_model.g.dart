// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => StoreModel(
      storeName: json['storeName'] as String,
      storeDescription: json['storeDescription'] as String,
      storeOwnerId: json['storeOwnerId'] as String,
      storeOwnerEmail: json['storeOwnerEmail'] as String,
    )..services = (json['services'] as List<dynamic>?)
        ?.map((e) => ServicesModel.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$StoreModelToJson(StoreModel instance) =>
    <String, dynamic>{
      'storeName': instance.storeName,
      'storeDescription': instance.storeDescription,
      'storeOwnerId': instance.storeOwnerId,
      'storeOwnerEmail': instance.storeOwnerEmail,
      'services': instance.services,
    };
