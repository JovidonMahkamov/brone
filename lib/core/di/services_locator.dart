

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/data_source/auth_remote_data_source.dart';
import '../../features/auth/data/data_source/auth_remote_data_source_impl.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/presentation/bloc/register/register_bloc.dart';
import '../network/dio_client.dart';
import '../untils/token_storage.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  // Core dependencies
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<DioClient>(() => DioClient());
  sl.registerLazySingleton<TokenStorage>(() => TokenStorage());

  // Auth
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(dioClient: sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authRemoteDataSource: sl()));
  // // Usecases
  sl.registerLazySingleton<RegisterUsecase>(() => RegisterUsecase(authRepository: sl()));
  //  //Bloc
  sl.registerFactory<RegisterBloc>(() => RegisterBloc(registerUsecase: sl()));

  //Bloc



}
