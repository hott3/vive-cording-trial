import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const FlowerApp());
}

class FlowerApp extends StatelessWidget {
  const FlowerApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'お花の見頃確認',
    theme: ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.pink,
      scaffoldBackgroundColor: Colors.white,
      cardTheme: const CardThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    ),
    home: const HomePage(),
    debugShowCheckedModeBanner: false,
  );
}
