import 'package:flutter/material.dart';
import 'package:kidslearning/ui/home_page.dart';
import 'package:kidslearning/ui/privacy_policy.dart';
import 'package:kidslearning/ui/settings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 1;

  static List<Widget> _pages = <Widget>[
    AppSettings(),
    HomePage(),
    PrivacyPolicy(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32,
        selectedItemColor: Color(0xFFF19335),
        selectedIconTheme: IconThemeData(color: Color(0xFFF19335)),
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),         //ImageIcon(AssetImage("assets/images/12Icon feather-settings.png")),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),         //ImageIcon(AssetImage("assets/images/12Group 1.png")),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.policy_outlined),     //ImageIcon(AssetImage("assets/images/privacy.png")),
            label: 'Privacy',
          ),
        ],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),

      ),

    );
  }
}
