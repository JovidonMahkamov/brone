import 'package:brone/core/untils/logger.dart';
import 'package:brone/features/auth/data/model/otp_model.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;
  var logger = Logger();


  AuthRemoteDataSourceImpl({required this.dioClient});


  @override
  Future<OtpModel> register({required String number}) async {
    final response = await dioClient.post(
      ApiUrls.auth,
      data: {"phone_number": number},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      LoggerService.info("Register response: ${response.data}");
      return OtpModel.fromJson(response.data);
    } else {
      LoggerService.warning("Logging file: ${response.data}");
      throw Exception("Failed to get Register user info");
    }
  }
}

class Logger {
}
