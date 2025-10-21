import 'package:flutter/material.dart';

class ButtonFunction extends StatefulWidget {
  const ButtonFunction({super.key, required this.button, this.press});
  final String button;
  final void Function()? press;
  @override
  State<ButtonFunction> createState() => _ButtonFunctionState();
}

class _ButtonFunctionState extends State<ButtonFunction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      child: ElevatedButton(
        onPressed: widget.press,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          widget.button,
          style: TextStyle(
            color: Colors.red,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
