import 'package:flutter/material.dart';

class ButtonIconRound extends StatelessWidget {
  final bool state;
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const ButtonIconRound(
      {Key? key,
      required this.state,
      required this.color,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: state ? null : onPressed,
      style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: state ? Colors.grey[300] : color,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(15.0)),
      child: Icon(icon),
    );
  }
}
