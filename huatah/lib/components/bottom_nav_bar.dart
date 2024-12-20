import "package:flutter/material.dart";
import "package:google_nav_bar/google_nav_bar.dart";

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  void Function(int) onTabChange;

  BottomNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: GNav(
        gap: 8,
        duration: const Duration(milliseconds: 400),
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        onTabChange: onTabChange,
        backgroundColor: Colors.white,
        tabs: [
          // Home page
          GButton(
            icon: Icons.home_outlined,
            iconColor: Colors.grey[500],
            iconActiveColor: Colors.black,
            iconSize: 24,
          ),

          // Budget page
          GButton(
            icon: Icons.attach_money,
            iconColor: Colors.grey[500],
            iconActiveColor: Colors.black,
            iconSize: 24,
          ),

          // Add button
          GButton(
            icon: Icons.add_circle,
            iconColor: Colors.orange,
            iconActiveColor: Colors.orange,
            iconSize: 32,
          ),

          // Gift box
          GButton(
            icon: Icons.card_giftcard_outlined,
            iconColor: Colors.grey[500],
            iconActiveColor: Colors.black,
            iconSize: 24,
          ),

          // Profile page
          GButton(
            icon: Icons.person_outlined,
            iconColor: Colors.grey[500],
            iconActiveColor: Colors.black,
            iconSize: 24,
          ),
        ],
      ),
    );
  }
}
