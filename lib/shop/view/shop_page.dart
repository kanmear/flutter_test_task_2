import 'package:flutter/material.dart';

import 'package:flutter_test_task_2/shop/view/widgets/app_bar.dart';
import 'package:flutter_test_task_2/shop/view/widgets/greeting.dart';
import 'package:flutter_test_task_2/shop/view/widgets/search_bar.dart';
import 'package:flutter_test_task_2/shop/view/widgets/recommended_combo.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xffF0F0F0),
        appBar: CustomAppBar(),
        drawer: Drawer(),
        body: Padding(
          padding: EdgeInsets.only(left: 32, right: 32),
          child: Column(children: [
            SizedBox(height: 16),
            GreetingText(),
            SizedBox(height: 38),
            CustomSearchBar(),
            SizedBox(height: 38),
            RecommendedCombo()
          ]),
        ));
  }
}
