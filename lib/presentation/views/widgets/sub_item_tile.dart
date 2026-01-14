import 'package:flutter/material.dart';

class SubItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  final bool isChecked;
  final ValueChanged<bool?> onCheck;

  const SubItemTile({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.isChecked,
    required this.onCheck,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 16, bottom: 10),
      child: Row(
        children: [
          Checkbox(value: isChecked, onChanged: onCheck),
          CircleAvatar(
            radius: 14,
            backgroundImage: NetworkImage(imageUrl),
          ),
          const SizedBox(width: 12),
          Text(title),
        ],
      ),
    );
  }
}
