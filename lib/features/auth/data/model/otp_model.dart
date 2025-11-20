import 'package:brone/features/auth/data/model/sms_model.dart';

import '../../domain/entities/otp_entity.dart';
import '../../domain/entities/sms_entity.dart';

class OtpModel extends OtpEntity {
  const OtpModel({
    required super.message,
    required super.tempOtp,
    required SmsEntity super.sms,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(
      message: json["message"] ?? "",
      tempOtp: json["temp_otp"] ?? "",
      sms: SmsModel.fromJson(json["sms"] ?? {}),
    );
  }
}
