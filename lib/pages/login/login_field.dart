import 'package:flutter/material.dart';
import 'package:quiz/utils/app_theme.dart';
import 'package:quiz/widgets/text_form_field.dart';

class LoginField extends StatefulWidget {
  const LoginField({super.key});

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  bool _visible = false;
  String? email, password;
  void submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });
    var formState = _formKey.currentState;

    formState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          cTextFormField(
            hintText: "Username/email",
            errorText: "Username/email is required!",
            prefixIcon: Icon(
              Icons.person,
              color: AppTheme.whiteish,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          cTextFormField(
            hintText: "Password",
            errorText: "Password is required",
            obsecureText: !_visible,
            prefixIcon: Icon(
              Icons.lock_open_outlined,
              color: AppTheme.whiteish,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _visible = !(_visible);
                });
              },
              icon: Icon(
                _visible ? Icons.visibility : Icons.visibility_off,
                color: AppTheme.whiteish,
              ),
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          ElevatedButton(
              onPressed: submit,
              child: Text(
                "Sign-in",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ))
        ],
      ),
    );
  }
}
