import 'package:flutter/material.dart';
import 'package:flutter_test_task_2/shop/view/shop_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ShopPage(),
    );
  }
}
