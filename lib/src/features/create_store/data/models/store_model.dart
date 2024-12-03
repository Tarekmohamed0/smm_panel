import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smm_panel/src/core/middleware/services_model.dart';
part 'store_model.g.dart';

@JsonSerializable()
class StoreModel {
  final String storeName;

  final String storeDescription;

  final String storeOwnerId;
  final String storeOwnerEmail;
  List<ServicesModel>? services;

  StoreModel({
    required this.storeName,
    required this.storeDescription,
    required this.storeOwnerId,
    required this.storeOwnerEmail,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreModelToJson(this);
}
