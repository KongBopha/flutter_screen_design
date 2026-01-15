import 'package:flutter/material.dart';
import 'package:flutter_testing/domain/models/itemmodel.dart';

class CategoryExpansionList extends StatefulWidget {
  final List<Item> items;
  final void Function(Item item, bool value)? onCategoryChecked;
  final void Function(Item item, SubItem subItem, bool value)? onSubItemChecked;

  const CategoryExpansionList({
    super.key,
    required this.items,
    this.onCategoryChecked,
    this.onSubItemChecked,
  });

  @override
  State<CategoryExpansionList> createState() => _CategoryExpansionListState();
}

class _CategoryExpansionListState extends State<CategoryExpansionList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.items.map(_buildCategory).toList(),
    );
  }

  Widget _buildCategory(Item item) {
    return Column(
      children: [
        InkWell(
          onTap: () => setState(() => item.isExpanded = !item.isExpanded),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Checkbox(
                  value: item.isChecked,
                  activeColor: Colors.red,
                  onChanged: (v) {
                    setState(() => item.isChecked = v ?? false);
                    widget.onCategoryChecked?.call(item, item.isChecked);
                  },
                ),
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(item.imageUrl),
                ),
                const SizedBox(width: 12),
                Text(
                  item.headerValue,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                Icon(item.isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ),

        if (item.isExpanded)
          Column(
            children: item.subItems.map((sub) {
              
              return Padding(
                padding: const EdgeInsets.only(left: 50, right: 16, bottom: 10),
                child: Row(
                  children: [
                    Checkbox(
                      value: sub.isChecked,
                      activeColor: Colors.red,
                      onChanged: (v) {
                        setState(() => sub.isChecked = v ?? false);
                        widget.onSubItemChecked?.call(item, sub, sub.isChecked);
                      },
                    ),
                    CircleAvatar(
                      radius: 14,
                      backgroundImage: NetworkImage(sub.imageUrl),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      sub.title,
                      style: const TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}