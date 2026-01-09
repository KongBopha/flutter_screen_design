import 'package:flutter/material.dart';
class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  final List<Map<String, dynamic>> _items = const [
    { 'title': 'Language', "icon":IconTheme(data: IconThemeData(color: Colors.red), child: Icon(Icons.language_rounded)),'trailing':Icon(Icons.arrow_forward_ios_outlined)},
    {'title': 'Terms and Condition','icon': IconTheme(data: IconThemeData(color: Colors.red), child: Icon(Icons.collections_bookmark_outlined)),'trailing':Icon(Icons.arrow_forward_ios_outlined)},
    {'title': 'Change User Password','icon': IconTheme(data: IconThemeData(color: Colors.red), child: Icon(Icons.lock_outline_rounded)),'trailing':Icon(Icons.arrow_forward_ios_outlined)},
    {'title': 'Logout','icon': IconTheme(data: IconThemeData(color: Colors.red), child: Icon(Icons.login_outlined)),'trailing':Icon(Icons.arrow_forward_ios_outlined)}

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return ListTile(
            leading: item['icon'],
            title: Text(item['title']),
            trailing: item['trailing'],
          );
        },
      ),
    );
  }
}
