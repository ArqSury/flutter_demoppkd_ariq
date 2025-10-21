import 'package:flutter/material.dart';

class InputFunction extends StatefulWidget {
  const InputFunction({super.key, required this.hint, this.isPassword = false});
  final String hint;
  final bool isPassword;

  @override
  State<InputFunction> createState() => _InputFunctionState();
}

class _InputFunctionState extends State<InputFunction> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        hintText: widget.hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.black),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  _obscureText = !_obscureText;
                  setState(() {});
                },
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
      ),
    );
  }
}
