import 'package:flutter/material.dart';

import '../widgets/bottom_navigation.dart';
import '../widgets/data_label.dart';

class DateRangePage extends StatefulWidget {
  const DateRangePage({Key? key}) : super(key: key);

  @override
  _DateRangePageState createState() => _DateRangePageState();
}

class _DateRangePageState extends State<DateRangePage> {
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text('What date?', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: clearDates,
            child: Text('Clear all', style: TextStyle(color: Color(0xFFBFD833))),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateLabel(
                  label: 'Start',
                  date: startDate,
                  onTap: () => pickDate(isStart: true),
                ),
                DateLabel(
                  label: 'End',
                  date: endDate,
                  onTap: () => pickDate(isStart: false),
                ),
              ],
            ),
          ),
          Expanded(
            child: CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              currentDate: DateTime.now(),
              onDateChanged: (date) {
                setState(() {
                  if (startDate == null || endDate != null) {
                    startDate = date;
                    endDate = null;
                  } else {
                    endDate = date;
                  }
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right:20, bottom: 20),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFBFD833),
                minimumSize: Size(double.infinity, 48),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Apply date range', style: TextStyle(color: Colors.black, fontSize: 16)),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1, onTap: (_) {}),

    );
  }

  void clearDates() {
    setState(() {
      startDate = null;
      endDate = null;
    });
  }

  Future<void> pickDate({required bool isStart}) async {
    DateTime initial = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStart ? (startDate ?? initial) : (endDate ?? initial),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }
}
