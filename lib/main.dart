import 'package:flutter/material.dart';
import 'package:website/utils/no_scrollbar_util.dart';
import 'package:website/views/portfolio_page.dart';

void main() {
  runApp(const ShaderApp());
}

class ShaderApp extends StatelessWidget {
  const ShaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aryan Pathak | Portfolio',
      theme: ThemeData.dark(),
      scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
      home: const PortfolioPage(),
    );
  }
}