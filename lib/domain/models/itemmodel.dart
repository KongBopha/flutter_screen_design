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
