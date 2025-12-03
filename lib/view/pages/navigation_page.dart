import 'package:flutter/material.dart';
import 'pages.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    InternationalPage(),
    Detailpage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: "Local",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplanemode_active),
            label: "International",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Pages"),
        ],
      ),
    );
  }
}
