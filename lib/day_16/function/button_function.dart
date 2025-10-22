import 'package:flutter/material.dart';

class ButtonFunction extends StatefulWidget {
  const ButtonFunction({
    super.key,
    this.press,
    required this.button,
    required this.tinggi,
    required this.lebar,
  });
  final void Function()? press;
  final String button;
  final double tinggi;
  final double lebar;
  @override
  State<ButtonFunction> createState() => _ButtonFunctionState();
}

class _ButtonFunctionState extends State<ButtonFunction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.tinggi,
      width: widget.lebar,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      child: ElevatedButton(
        onPressed: widget.press,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          widget.button,
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
