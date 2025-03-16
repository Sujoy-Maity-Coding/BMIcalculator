import 'package:flutter/cupertino.dart';

class CommonWidget extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  const CommonWidget({super.key, required this.color, required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10)
      ),
      child: cardChild,
    );
  }
}
