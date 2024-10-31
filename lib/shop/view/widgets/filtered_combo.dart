import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test_task_2/shop/state/salad_bloc.dart';

class FilteredCombo extends StatelessWidget {
  final SaladBloc saladBloc;

  const FilteredCombo({
    super.key,
    required this.saladBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          FilterButtons(saladBloc: saladBloc),
          FilteredItems(saladBloc: saladBloc),
        ],
      ),
    );
  }
}

class FilterButtons extends StatelessWidget {
  final SaladBloc saladBloc;

  const FilterButtons({
    super.key,
    required this.saladBloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaladBloc, SaladState>(
      bloc: saladBloc,
      builder: (context, state) {
        SaladFilter? selectedFilter;
        if (state is SaladListState) {
          selectedFilter = state.selectedFilter;
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: SaladFilter.values.map((filter) {
            final isSelected = filter == selectedFilter;

            return TextButton(
              onPressed: () {
                saladBloc.add(FilterSalads(filter));
              },
              style: TextButton.styleFrom(
                backgroundColor: isSelected ? Colors.blue : Colors.grey[200],
                textStyle: isSelected
                    ? const TextStyle(color: Colors.white)
                    : const TextStyle(color: Colors.black),
              ),
              child: Text(filter.toString().split('.').last),
            );
          }).toList(),
        );
      },
    );
  }
}

class FilteredItems extends StatelessWidget {
  final SaladBloc saladBloc;

  const FilteredItems({
    super.key,
    required this.saladBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SaladBloc, SaladState>(
        bloc: saladBloc,
        builder: (context, state) {
          if (state is SaladListState) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.salads.length,
              itemBuilder: (context, index) {
                final salad = state.salads[index];
                return Card(
                  child: Column(
                    children: [
                      Text(salad.name),
                      Text(salad.releaseDate.toString()),
                      Text(salad.lastOrdered.toString()),
                      Text(salad.ordersCount.toString()),
                      Text('\$${salad.price}'),
                      Text('Rating: ${salad.rating}'),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 16);
              },
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
