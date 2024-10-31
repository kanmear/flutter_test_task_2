import 'package:flutter/material.dart';

import 'package:flutter_test_task_2/shop/data/data.dart';

import 'package:flutter_test_task_2/shop/state/salad_filter_bloc.dart';

import 'package:flutter_test_task_2/shop/view/widgets/app_bar.dart';
import 'package:flutter_test_task_2/shop/view/widgets/filtered_combo.dart';
import 'package:flutter_test_task_2/shop/view/widgets/greeting.dart';
import 'package:flutter_test_task_2/shop/view/widgets/search_bar.dart';
import 'package:flutter_test_task_2/shop/view/widgets/recommended_combo.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffF0F0F0),
        appBar: const CustomAppBar(),
        drawer: const Drawer(),
        body: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32),
          child: Column(children: [
            const SizedBox(height: 16),
            const GreetingText(),
            const SizedBox(height: 38),
            const CustomSearchBar(),
            const SizedBox(height: 38),
            const RecommendedCombo(),
            const SizedBox(height: 48),
            FilteredCombo(saladBloc: SaladFilterBloc(Data.saladList)),
            const SizedBox(height: 16),
          ]),
        ));
  }
}
