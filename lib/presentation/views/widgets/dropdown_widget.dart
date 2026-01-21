import 'package:flutter/material.dart';

class DropdownWidget<T> extends StatelessWidget {
  final String labelText;
  final TextInputType? hintText;
  final T? selectedItem;
  final List<T> items;
  final ValueChanged<T?>? onChanged;
  final String Function(T) itemLabelBuilder;

  const DropdownWidget({
    super.key,
    required this.labelText,
             this.hintText,
    required this.selectedItem,
    required this.items,
    required this.onChanged,
    required this.itemLabelBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //hint text
        Text(hintText?.toString() ?? '', style: const TextStyle(color: Colors.grey)),
        /// Title
        Text(
          labelText,
          style: const TextStyle(
             
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: DropdownButtonFormField<T>(
            initialValue: selectedItem,
            onChanged: onChanged,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
            ),
            dropdownColor: Colors.white,
            style: const TextStyle(
              color: Colors.black,
            ),
            items: items.map((T value) {
              return DropdownMenuItem<T>(
                value: value,
                child: Text(
                  itemLabelBuilder(value),
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
