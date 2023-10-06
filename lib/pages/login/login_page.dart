import 'package:flutter/material.dart';
import 'package:quiz/pages/login/login_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Challenge yourself",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("What are you waiting for?.... Login",
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 30,
              ),
              const LoginField(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(children: [
                  TextButton(
                    onPressed: () {},
                    child: Text("Sign up"),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
