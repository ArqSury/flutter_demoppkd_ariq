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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        minimumSize: Size(100, 100),
      ),
      onPressed: widget.press,
      child: Text(widget.button),
    );
  }
}
