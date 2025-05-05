import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final IconData icon;
  final String label;
  final ValueChanged<int> onTap;

  const NavBarItem({
    Key? key,
    required this.index,
    required this.selectedIndex,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? Colors.black : Colors.grey),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
