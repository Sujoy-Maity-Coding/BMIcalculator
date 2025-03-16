import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints(minHeight: 56.0, minWidth: 56.0),
      shape: CircleBorder(),
      fillColor: Colors.blueGrey,
      child: Icon(icon),
    );
  }
}
