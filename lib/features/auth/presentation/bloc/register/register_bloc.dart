import 'package:brone/features/auth/presentation/bloc/register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../../domain/usecases/register_usecase.dart';
import '../auth_event.dart';

class RegisterBloc extends Bloc<OtpEvent, RegisterState> {
  final RegisterUsecase registerUsecase;
  var logger = Logger();

  RegisterBloc({required this.registerUsecase}) : super(RegisterInitial()) {
    on<OtpEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        final register = await registerUsecase.call(
          number: event.number,
        );
        emit(RegisterLoaded(otpEntity: register));
      } catch (e, s) {
        logger.e(s);
        emit(RegisterError(message: e.toString()));
      }
    });
  }
}
