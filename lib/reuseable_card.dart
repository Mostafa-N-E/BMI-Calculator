


import 'package:flutter/material.dart';

class ReusebleCard extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final VoidCallback? onPerss;

  ReusebleCard({this.color, this.child, this.onPerss});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPerss,
      child: Container(
        child: child,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: color ?? Color(0xff1d1e33),
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}