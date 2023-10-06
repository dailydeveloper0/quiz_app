// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  submitting,
  success,
  error,
}

class LoginState extends Equatable {
  final LoginStatus status;
  final CustomError? error;
  const LoginState({required this.status, required this.error});

  factory LoginState.initial() {
    return const LoginState(status: LoginStatus.initial, error: null);
  }

  @override
  List<Object> get props => [];

  LoginState copyWith({LoginStatus? status, CustomError? error}) {
    return LoginState(
        status: status ?? this.status, error: error ?? this.error);
  }

  @override
  bool get stringify => true;
}
