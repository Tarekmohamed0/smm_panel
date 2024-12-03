import 'package:dartz/dartz.dart';
import 'package:smm_panel/src/core/error/error.dart';
import 'package:smm_panel/src/features/create_store/data/models/store_model.dart';
import 'package:smm_panel/src/features/create_store/domain/repositories/create_store_repo.dart';

import '../sources/create_store_data_source.dart';

class CreateStoreRepoImpl extends CreateStoreRepo {
  @override
  Future<Either<Failure, void>> createStore(
      {required String storeName,
      required String storeDescription,
      required String storeOwnerId,
      required String storeOwnerEmail}) async {
    try {
      final store = await CreateStoreDataSource().createStore(
          storeName: storeName,
          storeDescription: storeDescription,
          storeOwnerId: storeOwnerId,
          storeOwnerEmail: storeOwnerEmail);
      return Future.value(Right(store));
    } catch (e) {
      return Future.value(Left(ServerFailure(e.toString())));
    }
  }
}
