

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../network/dio_client.dart';
import '../untils/token_storage.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  // Core dependencies
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<DioClient>(() => DioClient());
  sl.registerLazySingleton<TokenStorage>(() => TokenStorage());

  // Auth
  // sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(dioClient: sl()));
  // sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authRemoteDataSource: sl()));
  // // Usecases
  // sl.registerLazySingleton<RegisterUsecase>(() => RegisterUsecase(authRepository: sl()));
  //  //Bloc
  // sl.registerFactory<RegisterBloc>(() => RegisterBloc(registerUsecase: sl()));

  //Bloc



}
