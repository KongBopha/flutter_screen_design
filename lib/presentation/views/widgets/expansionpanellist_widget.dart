import 'package:flutter/material.dart';

class Item {
  List <String> expandedValue;
  List <String> imageUrl ;
  String headerValue;
  bool isExpanded;


  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
    this.imageUrl = const [],


  });
}

// List<Item> generateItems(int num) {
//   return List<Item>.generate(num, (int index) {
//     return Item(
//       expandedValue: "Expanded Value $index",
//       headerValue: "Header Value $index",
//     );
//   });
// }

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
      expandedValue: ['Women','T-shirt', 'Crop top','Hoodie','Jeans','Skirt'],
      imageUrl: ['https://i.pinimg.com/236x/20/61/f2/2061f2fbacdd9ad3e32cf9c3af02e028.jpg','']
      ),
    Item(
      headerValue: 'Men', 
      expandedValue: ['Men','T-shirt', 'Crop top','Hoodie','Jeans','Skirt'],
      imageUrl: ['https://i.pinimg.com/236x/20/61/f2/2061f2fbacdd9ad3e32cf9c3af02e028.jpg','']
      ),
    Item(
      headerValue: 'Kids', 
      expandedValue: ['Kids','T-shirt', 'Crop top','Hoodie','Jeans','Skirt'],
      imageUrl: ['https://i.pinimg.com/236x/20/61/f2/2061f2fbacdd9ad3e32cf9c3af02e028.jpg','']
      ),
    ];
    bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _buildPanel(),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          isExpanded: item.isExpanded,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: Column(
            children: item.expandedValue.map((detail) => ListTile(
              title: Text(detail),
              leading: Icon(Icons.check_box_outline_blank),
            )).toList(),
          ),
        );
      }).toList(),
    );
  }
}
