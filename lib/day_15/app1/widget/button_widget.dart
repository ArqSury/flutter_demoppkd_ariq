import 'package:flutter/material.dart';

class ButtonFunction extends StatefulWidget {
  const ButtonFunction({
    super.key,
    required this.button,
    this.press,
    required this.height,
    required this.widht,
    required this.buttoncolor,
  });
  final String button;
  final double height;
  final double widht;
  final int buttoncolor;
  final void Function()? press;
  @override
  State<ButtonFunction> createState() => _ButtonFunctionState();
}

class _ButtonFunctionState extends State<ButtonFunction> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(widget.buttoncolor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        minimumSize: Size(widget.widht, widget.height),
      ),
      onPressed: widget.press,
      child: Text(widget.button),
    );
  }
}
