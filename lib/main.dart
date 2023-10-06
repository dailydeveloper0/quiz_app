import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/blocs/auth/authentication_bloc.dart';
import 'package:quiz/cubits/login/login_cubit.dart';
import 'package:quiz/pages/login/login_page.dart';
import 'package:quiz/repositories/authentication.dart';
import 'package:quiz/utils/app_theme.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthenticationRepository())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationBloc(
              authenticationRepository:
                  context.read<AuthenticationRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => LoginCubit(
              authenticationRepository:
                  context.read<AuthenticationRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: "Quiz App",
          home: const LoginPage(),
          theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: AppTheme.primaryColor,
            secondary: AppTheme.orange,
            background: AppTheme.backgroundColor,
          )),
        ),
      ),
    );
  }
}
