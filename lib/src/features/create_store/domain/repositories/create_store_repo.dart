import 'package:dartz/dartz.dart';
import 'package:smm_panel/src/features/create_store/data/models/store_model.dart';

import '../../../../core/error/error.dart';

abstract class CreateStoreRepo {
  Future<Either<Failure, void>> createStore(
      {required String storeName,
      required String storeDescription,
      required String storeOwnerId,
      required String storeOwnerEmail});
}
