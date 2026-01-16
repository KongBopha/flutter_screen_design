import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  const FieldTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: Colors.black
        ),
      ),
    );
  }
}
