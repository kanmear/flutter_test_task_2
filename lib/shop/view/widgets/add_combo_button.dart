import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test_task_2/shop/state/basket_counter_cubit.dart';

class AddComboButton extends StatelessWidget {
  final String comboName;

  const AddComboButton({
    super.key,
    required this.comboName,
  });

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();

    return GestureDetector(
      onTap: () {
        counterCubit.increment();
        _showInfoPopup(context, comboName);
      },
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

  void _showInfoPopup(BuildContext context, String comboName) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Info'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Center(child: Text("Added $comboName in the basket"))],
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
}
