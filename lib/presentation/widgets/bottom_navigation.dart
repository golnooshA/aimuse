import 'package:flutter/material.dart';
import 'navigation_bar.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavBarItem(
            index: 0,
            selectedIndex: selectedIndex,
            icon: Icons.home,
            label: 'Home',
            onTap: onTap,
          ),
          NavBarItem(
            index: 1,
            selectedIndex: selectedIndex,
            icon: Icons.edit,
            label: 'Explore',
            onTap: onTap,
          ),
          NavBarItem(
            index: 2,
            selectedIndex: selectedIndex,
            icon: Icons.people,
            label: 'Connection',
            onTap: onTap,
          ),
          NavBarItem(
            index: 3,
            selectedIndex: selectedIndex,
            icon: Icons.person,
            label: 'Profile',
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
