import 'package:flutter/material.dart';

class SubItem {
  final String title;
  final String imageUrl;
  bool isChecked;

  SubItem({
    required this.title,
    required this.imageUrl,
    this.isChecked = false,
  });
}

class Item {
  final String headerValue;
  final String imageUrl;
  final List<SubItem> subItems;

  bool isExpanded;
  bool isChecked;

  Item({
    required this.headerValue,
    required this.imageUrl,
    required this.subItems,
    this.isExpanded = false,
    this.isChecked = false,
  });
}

class ExpansionpanellistWidget extends StatefulWidget {
  const ExpansionpanellistWidget({super.key});

  @override
  State<ExpansionpanellistWidget> createState() =>
      _ExpansionpanellistWidgetState();
}

class _ExpansionpanellistWidgetState
    extends State<ExpansionpanellistWidget> {
  final List<Item> _data = [
    Item(
      headerValue: 'Women',
      imageUrl:
          'https://i.pinimg.com/236x/20/61/f2/2061f2fbacdd9ad3e32cf9c3af02e028.jpg',
      subItems: [
        SubItem(
          title: 'T-shirt',
          imageUrl:
              'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab',
        ),
        SubItem(
          title: 'Tank Tops',
          imageUrl:
              'https://images.unsplash.com/photo-1512436991641-6745cdb1723f',
        ),
        SubItem(
          title: 'Polos',
          imageUrl:
              'https://images.unsplash.com/photo-1583743814966-8936f5b7be1a',
        ),
      ],
    ),
    Item(
      headerValue: 'Men',
      imageUrl:
          'https://i.pinimg.com/originals/bd/ee/66/bdee662afda31d05b8175665bc6bc110.jpg',
      subItems: [
        SubItem(
          title: 'Jackets',
          imageUrl:
              'https://images.unsplash.com/photo-1520975916090-3105956dac38',
        ),
        SubItem(
          title: 'Hoodies',
          imageUrl:
              'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: _data.map(_buildCategory).toList(),
      ),
    );
  }

  Widget _buildCategory(Item item) {
    return Column(
      children: [
        // ===== MAIN CATEGORY =====
        InkWell(
          onTap: () {
            setState(() => item.isExpanded = !item.isExpanded);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Checkbox(
                  value: item.isChecked,
                  onChanged: (v) {
                    setState(() => item.isChecked = v ?? false);
                  },
                  checkColor: Colors.red,
                  

                ),
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(item.imageUrl),
                ),
                const SizedBox(width: 12),
                Text(
                  item.headerValue,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black87),
                ),
                const Spacer(),
                Icon(item.isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ),

        // ===== SUB ITEMS =====
        if (item.isExpanded)
          Column(
            children: item.subItems.map((sub) {
              return Padding(
                padding:
                    const EdgeInsets.only(left: 50, right: 16, bottom: 10),
                child: Row(
                  children: [
                    Checkbox(
                      value: sub.isChecked,
                      onChanged: (v) {
                        setState(() => sub.isChecked = v ?? false);
                      },
                      checkColor: Colors.red,
                    ),
                    CircleAvatar(
                      radius: 14,
                      backgroundImage: NetworkImage(sub.imageUrl),
                    ),
                    const SizedBox(width: 12),
                    Text(sub.title, style: const TextStyle(fontSize: 14,color: Colors.black87)),
                  ],
                ),
              );
            }).toList(),
          ),

        const Divider(height: 1),
      ],
    );
  }
}
