// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

enum AuthenticationStatus { unknwon, authenticated, unauthenticated }

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final UserSession? userSession;

  const AuthenticationState({required this.status, required this.userSession});

  factory AuthenticationState.initial() {
    return const AuthenticationState(
        status: AuthenticationStatus.unknwon, userSession: null);
  }

  @override
  List<Object?> get props => [status, userSession];

  @override
  bool get stringify => true;

  AuthenticationState copyWith(
      {AuthenticationStatus? status, UserSession? userSession}) {
    return AuthenticationState(
        status: status ?? this.status, userSession: userSession??this.userSession);
  }
}
