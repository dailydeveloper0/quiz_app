import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz/models/custom_error.dart';
import 'package:quiz/repositories/authentication.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthenticationRepository authenticationRepository;
  LoginCubit({required this.authenticationRepository})
      : super(LoginState.initial());

  Future login({required String userName, required String password}) async {
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      await authenticationRepository.login(
        userName: userName,
        password: password,
      );

      emit(state.copyWith(status: LoginStatus.success));
    } on CustomError catch (e) {
      emit(state.copyWith(
        status: LoginStatus.error,
        error: e,
      ));
    }
  }
}
