import '../../domain/entities/sms_entity.dart';

class SmsModel extends SmsEntity {
  const SmsModel({
    required super.id,
    required super.message,
    required super.status,
  });

  factory SmsModel.fromJson(Map<String, dynamic> json) {
    return SmsModel(
      id: json["id"] ?? "",
      message: json["message"] ?? "",
      status: json["status"] ?? "",
    );
  }
}
