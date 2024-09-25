import 'package:flutter/material.dart';
import 'package:html_app_compiler/html_compiler_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HTML Runner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HtmlCompilerScreen(),
    );
  }
}
