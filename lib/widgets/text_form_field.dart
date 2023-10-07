import 'package:flutter/material.dart';
class cTextFormField extends StatefulWidget {
  final String? hintText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obsecureText;
  const cTextFormField({
    super.key,
    this.hintText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.obsecureText = false,
  });

  @override
  State<cTextFormField> createState() => _cTextFormFieldState();
}

class _cTextFormFieldState extends State<cTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      obscureText: widget.obsecureText,
      validator: ((value) {
        if (value == '' || value == null) {
          return widget.errorText;
        }
        return null;
      }),
    );
  }
}
