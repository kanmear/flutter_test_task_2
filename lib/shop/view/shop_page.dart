import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test_task_2/shop/state/basket_counter_cubit.dart';

import 'package:flutter_test_task_2/shop/view/widgets/app_bar.dart';
import 'package:flutter_test_task_2/shop/view/widgets/greeting.dart';
import 'package:flutter_test_task_2/shop/view/widgets/filtered_combo.dart';
import 'package:flutter_test_task_2/shop/view/widgets/search_combo.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xffF0F0F0),
          appBar: CustomAppBar(),
          drawer: Drawer(),
          body: Padding(
            padding: EdgeInsets.only(left: 32, right: 32),
            child: Column(children: [
              SizedBox(height: 16),
              GreetingText(),
              SizedBox(height: 38),
              SearchCombo(),
              SizedBox(height: 48),
              FilteredCombo(),
              SizedBox(height: 16),
            ]),
          )),
    );
  }
}
