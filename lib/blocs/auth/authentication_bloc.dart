import 'dart:async';
import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:quiz/models/user_session.dart';
import 'package:quiz/repositories/authentication.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  late StreamSubscription _authenticationSubscription;
  AuthenticationBloc({required this.authenticationRepository})
      : super(AuthenticationState.initial()) {
    _authenticationSubscription =
        authenticationRepository.status.listen((UserSession? userSession) {
      add(AuthStateChanged(
           userSession:userSession));
    });
    on<AuthStateChanged>((event, emit) {
      if (event.userSession != null) {
        emit(
          state.copyWith(
            status: AuthenticationStatus.authenticated,
            userSession: event.userSession,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: AuthenticationStatus.unauthenticated,
            userSession: null,
          ),
        );
      }
    });
    on<Logout>(
      (event, emit) {
        authenticationRepository.logout();
      },
    );
  }
}
