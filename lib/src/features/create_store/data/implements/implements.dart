
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class Create_storeRepositoryImp implements Create_storeRepository{

        final Create_storeRemoteDataSource remoteDataSource;
        Create_storeRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    