import 'package:brone/features/auth/data/model/otp_model.dart';

abstract class AuthRemoteDataSource {
  Future<OtpModel> register(
      {required String number});

}