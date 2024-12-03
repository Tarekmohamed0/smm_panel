import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smm_panel/src/core/middleware/services_model.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.error(String message) = Error;
  const factory HomeState.loaded(List<ServicesModel> services) = Loaded;
  const factory HomeState.services(List<ServicesModel> services) = Services;
}
