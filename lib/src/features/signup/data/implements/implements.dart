
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class SignupRepositoryImp implements SignupRepository{

        final SignupRemoteDataSource remoteDataSource;
        SignupRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    