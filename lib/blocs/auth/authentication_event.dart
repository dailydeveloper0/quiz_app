part of 'authentication_bloc.dart';


abstract class AuthenticationEvent {}

class AuthStateChanged extends AuthenticationEvent {
  final UserSession? userSession;
    AuthStateChanged({ required this.userSession });
}

class Logout extends AuthenticationEvent {}
