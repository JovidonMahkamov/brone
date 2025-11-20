import 'package:brone/features/auth/domain/entities/otp_entity.dart';

import '../../domain/repositories/auth_repository.dart';
import '../data_source/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<OtpEntity> register({
    required String number,
  }) {
    return authRemoteDataSource.register(number: number);
  }
}