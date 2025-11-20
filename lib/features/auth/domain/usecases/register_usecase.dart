import 'package:brone/features/auth/domain/entities/otp_entity.dart';

import '../repositories/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository authRepository;

  RegisterUsecase({required this.authRepository});

  Future<OtpEntity> call({
    required String number,
  }) {
    return authRepository.register(number: number);
  }
}
