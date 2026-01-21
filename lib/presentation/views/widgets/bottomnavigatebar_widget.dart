import 'package:flutter/material.dart';
import 'package:flutter_testing/presentation/views/screens/homescreen.dart';
import 'package:flutter_testing/presentation/views/screens/profile_screen.dart';
import 'package:flutter_testing/presentation/views/screens/updatescreen.dart';

class BottomnavigatebarWidget extends StatefulWidget {
  const BottomnavigatebarWidget({super.key});

  @override
  State<BottomnavigatebarWidget> createState() =>
      _BottomnavigatebarWidgetState();
}

class _BottomnavigatebarWidgetState extends State<BottomnavigatebarWidget> {
  int _selectedIndex = 0;
  final List <Widget> pages = [
    Homescreen(),
    UpdateScreen(),
    ProfileInfo(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.redAccent),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() => _selectedIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book_outlined), label: 'Update'),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: 'Profile'),
        ],
        
      ),
      body: pages[_selectedIndex],
    );
  }
}
