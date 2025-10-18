import 'package:flutter/material.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({super.key, required this.image});

  final String image;

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: Border.all(),
      ),
      child: IconButton(
        onPressed: () {
          setState(() {});
        },
        icon: Image(image: AssetImage(widget.image), height: 36, width: 36),
      ),
    );
  }
}
