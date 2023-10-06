import 'package:flutter/material.dart';

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
          TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              hintText: "Username/email",
              prefixIcon: const Icon(Icons.person),
            ),
            validator: ((value) {
              if (value == '' || value == null) {
                return "Username/email is required";
              }
              return null;
            }),
          ),
          const SizedBox(
            height: 15.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              hintText: "Password",
              prefixIcon: const Icon(
                Icons.lock_open_outlined,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _visible = !(_visible);
                  });
                },
                icon: Icon(
                  _visible ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            obscureText: _visible,
            validator: ((value) {
              if (value == '' || value == null) {
                return "Password is required";
              }
              return null;
            }),
          ),
          const SizedBox(
            height: 25.0,
          ),
          ElevatedButton(
              onPressed: submit,
              child: Text(
                "Sign-in",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
