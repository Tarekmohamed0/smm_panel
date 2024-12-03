import 'package:freezed_annotation/freezed_annotation.dart';
part 'services_model.g.dart';

@JsonSerializable()
class ServicesModel {
  @JsonKey(name: 'service')
  final String serviceId;
  @JsonKey(name: 'name')
  final String serviceName;
  final String type;
  final String rate;
  final String min;
  final String max;
  final bool dripfeed;
  final bool refill;
  final bool cancel;
  final String category;

// from json
  factory ServicesModel.fromJson(Map<String, dynamic> json) =>
      _$ServicesModelFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$ServicesModelToJson(this);

  ServicesModel({
    required this.serviceId,
    required this.serviceName,
    required this.type,
    required this.rate,
    required this.min,
    required this.max,
    required this.dripfeed,
    required this.refill,
    required this.cancel,
    required this.category,
  });
}
