import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_test_task_2/shop/state/basket_counter_cubit.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.read<CounterCubit>();

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 32),
      child: AppBar(
        backgroundColor: const Color(0xffF0F0F0),
        leading: SvgPicture.asset(
          'assets/svg/menu.svg',
          width: 24,
          height: 24,
          fit: BoxFit.scaleDown,
        ),
        actions: [
          GestureDetector(
              onTap: () => _showCounterPopup(context, counter),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/shopping_basket.svg',
                    width: 24,
                    height: 24,
                    fit: BoxFit.scaleDown,
                  ),
                  const Text(
                    'My basket',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                  )
                ],
              ))
        ],
      ),
    );
  }

  void _showCounterPopup(BuildContext context, CounterCubit counter) {
    final count = counter.state;

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Basket'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                    child: count == 0
                        ? const Text('Basket is empty')
                        : Text(
                            'The increment button was pressed ${counter.state} times.')),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          );
        });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
