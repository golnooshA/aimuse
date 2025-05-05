

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateLabel extends StatelessWidget {
  final String label;
  final DateTime? date;
  final VoidCallback onTap;

  const DateLabel({
    super.key,
    required this.label,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final display = date != null
        ? '$label ${DateFormat('MMMM d, y').format(date!)}'
        : label;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          display,
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
