import 'package:flutter/material.dart';

class Buttoninput extends StatefulWidget {
  const Buttoninput({
    super.key,
    this.press,
    required this.button,
    required this.tinggi,
    required this.lebar,
    this.backgroundColor,
    this.color,
  });
  final void Function()? press;
  final String button;
  final double tinggi;
  final double lebar;
  final Color? backgroundColor;
  final Color? color;

  @override
  State<Buttoninput> createState() => _ButtoninputState();
}

class _ButtoninputState extends State<Buttoninput> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.press,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(widget.lebar, widget.tinggi),
        backgroundColor: widget.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        widget.button,
        style: TextStyle(
          color: widget.color,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
