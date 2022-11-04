import 'package:flutter/material.dart';
import 'package:inventorymanagementsystem/screens/mainscreen.dart';
import 'package:inventorymanagementsystem/theme/material_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: materialAppTheme.theme,
      home: const MainScreen(),
    );
  }
}

