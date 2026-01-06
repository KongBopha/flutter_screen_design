 import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  const CardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            width: 8,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            Text(subtitle),
          ],
        ),
    );
  }
}
