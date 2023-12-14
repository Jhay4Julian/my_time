import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  VoidCallback onPressed;
  final Color color;

  MyButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: MaterialButton(
        height: 50,
        color: color,
        onPressed: onPressed,
        child: Center(
            child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
