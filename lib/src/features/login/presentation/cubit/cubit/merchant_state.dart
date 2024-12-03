import 'package:freezed_annotation/freezed_annotation.dart';
part 'merchant_state.freezed.dart';

@freezed
class MerchantState with _$MerchantState {
  const factory MerchantState.initial() = _Initial;
  const factory MerchantState.loading() = Loading;
  const factory MerchantState.loaded() = Loaded;
  const factory MerchantState.error(String message) = Error;
}
