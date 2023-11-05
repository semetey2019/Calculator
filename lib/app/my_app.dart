import 'package:flutter/material.dart';
import 'package:tex_zadacha/inputs/inputs.dart';
import 'package:tex_zadacha/inputs/search_page.dart';
import 'package:tex_zadacha/inputs/search_page2.dart';
import 'package:tex_zadacha/pages/first_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InputPage(),
    );
  }
}
