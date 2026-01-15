import 'package:flutter/material.dart';
import 'package:flutter_testing/domain/models/itemmodel.dart';
import 'package:flutter_testing/presentation/views/widgets/expansionpanellist_widget.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const List<Tab> tabs = [
    Tab(text: 'New'),
    Tab(text: 'Processing'),
    Tab(text: 'Delivering'),
    Tab(text: 'Completed'),
  ];

  final List<Item> categories = [
    Item(
      headerValue: 'Women',
      imageUrl:
          'https://i.pinimg.com/236x/20/61/f2/2061f2fbacdd9ad3e32cf9c3af02e028.jpg',
      subItems: [
        SubItem(
            title: 'T-shirt',
            imageUrl:
                'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab'),
        SubItem(
            title: 'Tank Tops',
            imageUrl:
                'https://images.unsplash.com/photo-1512436991641-6745cdb1723f'),
        SubItem(
            title: 'Polos',
            imageUrl:
                'https://images.unsplash.com/photo-1583743814966-8936f5b7be1a'),
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
                'https://images.unsplash.com/photo-1520975916090-3105956dac38'),
        SubItem(
            title: 'Hoodies',
            imageUrl:
                'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f'),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        
        appBar: AppBar(
          title: const Text('Filter'),
          bottom: TabBar(
            controller: _tabController,
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            CategoryExpansionList(
              items: categories,
              onCategoryChecked: (item, value) {
                debugPrint('${item.headerValue} checked: $value');
              },
              onSubItemChecked: (item, subItem, value) {
                debugPrint('${item.headerValue} -> ${subItem.title}: $value');
              },
            ),
            const Center(child: Text('Processing Orders',style: TextStyle(color: Colors.black),)),
            const Center(child: Text('Delivering Orders',style: TextStyle(color: Colors.black))),
            const Center(child: Text('Completed Orders',style: TextStyle(color: Colors.black))),
          ],
        ),
      ),
    );
  }
}
