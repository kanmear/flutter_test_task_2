import 'package:flutter_test_task_2/shop/view/ui_data.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test_task_2/shop/data/data.dart';
import 'package:flutter_test_task_2/shop/data/models/salad.dart';

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
                return SaladTile(salad: salad);
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

class SaladTile extends StatelessWidget {
  final Salad salad;

  const SaladTile({super.key, required this.salad});

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter = NumberFormat('#,000');

    final backgroundColor = UiData.getRandomColor();

    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 8),
            SizedBox(
              height: 64,
              child: Image.network(
                Data.getSrcById(salad.id),
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;

                  return Center(
                    child: CircularProgressIndicator(
                      color: const Color(0xffF08626),
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  salad.name,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "¥ ${formatter.format(salad.price)}",
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffF08626)),
                  ),
                  const AddIconButton()
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
        const Positioned(
          right: 8,
          top: 8,
          child: Icon(
            Icons.favorite_border,
            color: Color(0xffFFA451),
            size: 16,
          ),
        )
      ]),
    );
  }
}

class AddIconButton extends StatelessWidget {
  const AddIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
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
