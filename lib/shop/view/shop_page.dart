import 'package:flutter/material.dart';

import 'package:flutter_test_task_2/shop/view/widgets/app_bar.dart';
import 'package:flutter_test_task_2/shop/view/widgets/greeting.dart';
import 'package:flutter_test_task_2/shop/view/widgets/search_bar.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(),
        drawer: Drawer(),
        body: Padding(
          padding: EdgeInsets.only(left: 32, right: 32),
          child: Column(children: [
            SizedBox(height: 16),
            GreetingText(),
            SizedBox(height: 38),
            CustomSearchBar()
          ]),
        ));
  }
}
