import '../entities/otp_entity.dart';

abstract class AuthRepository{

  Future<OtpEntity> register({required String number});

}