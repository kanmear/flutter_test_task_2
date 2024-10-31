import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test_task_2/shop/state/basket_counter_cubit.dart';

class AddComboButton extends StatelessWidget {
  const AddComboButton({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();

    return GestureDetector(
      onTap: () => counterCubit.increment(),
      child: const SizedBox(
        height: 24,
        width: 24,
        child: Stack(children: [
          Icon(
            Icons.circle,
            color: Color(0xffFFE3C9),
          ),
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.add,
              color: Color(0xffEC7B15),
              size: 16,
            ),
          ),
        ]),
      ),
    );
  }
}
