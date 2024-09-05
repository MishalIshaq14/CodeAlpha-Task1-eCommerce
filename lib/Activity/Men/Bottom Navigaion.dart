import 'package:flutter/material.dart';
import 'package:footwear/Activity/Home%20Screen.dart';
import 'package:footwear/Activity/Men/Cart%20Screen.dart';
import 'package:footwear/Activity/Men/Men%20Screen.dart';
import 'package:footwear/Activity/Setting%20screen.dart';

class BottomNavigaion extends StatefulWidget {
  const BottomNavigaion({super.key});

  @override
  State<BottomNavigaion> createState() => _BottomNavigaionState();
}

class _BottomNavigaionState extends State<BottomNavigaion> {
  int _selecteditem = 0;


final List<Widget> _pages = [
    MenScreen(),
    Cart(cartItems:[]),
    SettingScreen(),
    HomeScreen(),
  ];


  void _onitemtapped(int index) {
    setState(() {
      _selecteditem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
            height: 60,
            selectedIndex: _selecteditem,
            onDestinationSelected: _onitemtapped,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.recent_actors), label: "Recent"),
              NavigationDestination(icon: Icon(Icons.favorite), label: "Cart"),
              NavigationDestination(icon: Icon(Icons.settings), label: "Setting"),
              NavigationDestination(
                  icon: Icon(Icons.home), label: "Home"),
            ]),
        body: _pages[_selecteditem]);
  }
}
