import 'package:aimuse/presentation/pages/filter_page.dart';
import 'package:flutter/material.dart';
import 'core/config/app_them.dart';
import 'presentation/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AiMuse',
      theme: AppTheme.lightTheme,
      home: FilterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
