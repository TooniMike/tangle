import 'package:flutter/material.dart';
import '../pages/pages.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int _selectedTab = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const Scaffold(body: Center(child: Text('Favorite Page'),),),
    const Scaffold(body: Center(child: Text('Inbox Page'),),),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: _onItemTapped,
          showSelectedLabels: false,
          iconSize: 30,
          showUnselectedLabels: false,
          elevation: 0,
          selectedItemColor: const Color(0xFFE34180),
          unselectedItemColor: const Color(0xFFE34180),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home_filled),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined),
                activeIcon: Icon(Icons.favorite),
                label: 'Fav'),
            BottomNavigationBarItem(
                icon: Icon(Icons.mail_outline),
                activeIcon: Icon(Icons.mail),
                label: 'Messages'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                activeIcon: Icon(Icons.person),
                label: 'Home'),
          ]),
    );
  }
}
