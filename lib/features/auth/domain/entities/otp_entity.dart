import 'package:brone/features/auth/domain/entities/sms_entity.dart';

class OtpEntity {
  final String message;
  final String tempOtp;
  final SmsEntity sms;

  const OtpEntity({
    required this.message,
    required this.tempOtp,
    required this.sms,
  });
}
