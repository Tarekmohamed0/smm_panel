import 'package:dartz/dartz.dart';
import 'package:smm_panel/src/core/error/error.dart';
import 'package:smm_panel/src/features/create_store/data/implements/create_store_repo_impl.dart';
import 'package:smm_panel/src/features/create_store/domain/repositories/create_store_repo.dart';

class CreateStoreUsecase {
  final CreateStoreRepo repository = CreateStoreRepoImpl();

  Future<Either<Failure, void>> call({
    required String storeName,
    required String storeDescription,
    required String storeOwnerId,
    required String storeOwnerEmail,
  }) async {
    return await repository.createStore(
      storeName: storeName,
      storeDescription: storeDescription,
      storeOwnerId: storeOwnerId,
      storeOwnerEmail: storeOwnerEmail,
    );
  }
}
