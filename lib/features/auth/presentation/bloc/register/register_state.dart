import 'package:brone/features/auth/domain/entities/otp_entity.dart';

class RegisterState {}

class RegisterInitial extends RegisterState{}

class RegisterLoading extends RegisterState{}

class RegisterLoaded extends RegisterState{
  final OtpEntity otpEntity;

  RegisterLoaded({required this.otpEntity});
}

class RegisterError extends RegisterState{
  final String message;

  RegisterError({required this.message});
}