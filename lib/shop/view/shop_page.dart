import 'package:flutter/material.dart';
import 'package:flutter_test_task_2/shop/view/widgets/app_bar.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      drawer: Drawer(),
      body: SizedBox(),
    );
  }
}
