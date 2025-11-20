abstract class AuthEvent {
  const AuthEvent();
}

class OtpEvent extends AuthEvent{
  final String number;

  OtpEvent({required this.number});
}