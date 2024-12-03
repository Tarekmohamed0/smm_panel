import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/store_model.dart';
part 'create_store_state.freezed.dart';

@freezed
class CreateStoreState with _$CreateStoreState {
  const factory CreateStoreState.initial() = _Initial;
  const factory CreateStoreState.loading() = Loading;
  const factory CreateStoreState.error(String message) = Error;
  const factory CreateStoreState.loaded(String message) = Loaded;
  const factory CreateStoreState.stores(List<StoreModel> stores) = Stores;
}
