import "package:flutter/material.dart";
import "package:huatah/components/bottom_nav_bar.dart";
import "package:huatah/pages/add_page.dart";
import "package:huatah/pages/budget_page.dart";
import "package:huatah/pages/giftcard_page.dart";
import "package:huatah/pages/home_page.dart";
import "package:huatah/pages/profile_page.dart";

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const BudgetPage(),
    const AddPage(),
    const GiftcardPage(),
    const ProfilePage(),
  ];

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(onTabChange: navigateBottomBar),
    );
  }
}
