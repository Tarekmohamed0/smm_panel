// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicesModel _$ServicesModelFromJson(Map<String, dynamic> json) =>
    ServicesModel(
      serviceId: json['service'] as String,
      serviceName: json['name'] as String,
      type: json['type'] as String,
      rate: json['rate'] as String,
      min: json['min'] as String,
      max: json['max'] as String,
      dripfeed: json['dripfeed'] as bool,
      refill: json['refill'] as bool,
      cancel: json['cancel'] as bool,
      category: json['category'] as String,
    );

Map<String, dynamic> _$ServicesModelToJson(ServicesModel instance) =>
    <String, dynamic>{
      'service': instance.serviceId,
      'name': instance.serviceName,
      'type': instance.type,
      'rate': instance.rate,
      'min': instance.min,
      'max': instance.max,
      'dripfeed': instance.dripfeed,
      'refill': instance.refill,
      'cancel': instance.cancel,
      'category': instance.category,
    };
