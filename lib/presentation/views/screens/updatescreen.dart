import 'package:flutter/material.dart';
import 'package:flutter_testing/presentation/views/widgets/expansionpanellist_widget.dart';

class Updatescreen extends StatefulWidget {
  const Updatescreen({super.key});

  @override
  State<Updatescreen> createState() => _UpdatescreenState();
}

class _UpdatescreenState extends State<Updatescreen> with SingleTickerProviderStateMixin{
  static const List<Tab> tabs = <Tab>[
    Tab(text: 'New',),
    Tab(text: 'Processing',),
    Tab(text: 'Delivering',),
    Tab(text: 'Completed',),
  ];
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(vsync:this,length: tabs.length);
  }
  @override
  void dispose(){
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
          children: const <Widget>[ 
             ExpansionpanellistWidget(),
            Center(child: Text('Processing Orders',style: TextStyle(color: Colors.black),)),
            Center(child: Text('Delivering Orders',style: TextStyle(color: Colors.black),)),
            Center(child: Text('Completed Orders',style: TextStyle(color: Colors.black),)),
          ], 
        ),
      ),
    );
  }
}