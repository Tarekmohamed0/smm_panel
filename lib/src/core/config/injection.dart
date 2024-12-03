library dependency_injection;

import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

import '../constants/colors.dart';
import '../services/api_services.dart';
import '../utils/auth_services.dart';
import '../utils/dio_interceptors.dart';

class DependencyInjection {}

final sl = GetIt.instance;
void Setup() {
  sl.registerSingleton<AppColor>(AppColor());
// firebase services

  sl.registerLazySingleton<AuthServices>(() => AuthServices());
  // services
  sl.registerLazySingleton<ApiServices>(
      () => ApiServices(DioInterceptors.createAndSetupDio()));

  // sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  // // sl.registerSingleton<SigninFirebasedataSource>(SigninFirebasedataSource());
  // // // repositories
  // // sl.registerSingleton<SigninRepositoryImp>(SigninRepositoryImp());
  // // sl.registerSingleton<SigninRepository>(SigninRepositoryImp());
  // // // usecases
  // sl.registerLazySingleton<SignupUseCase>(() => SignupUseCase(
  //     repository: SignupRepoImpl(remoteDataSource: SignupRemoteDataSource())));
  // sl.registerLazySingleton<SigninUsecase>(() => SigninUsecase(
  //     signInrepository:
  //         SigninRepositoryImp(remoteDataSource: SigninRemoteDataSource())));
  // sl.registerSingleton<SignupUsecase>(SignupUsecase());
  // sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  // sl.registerSingleton<SigninUsecas>(SigninUsecas());
  // blocs

  // pages
}
