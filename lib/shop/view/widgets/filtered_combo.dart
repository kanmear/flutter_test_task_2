import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test_task_2/shop/data/data.dart';
import 'package:flutter_test_task_2/shop/data/models/salad.dart';

import 'package:flutter_test_task_2/shop/state/salad_filter_bloc.dart';

import 'package:flutter_test_task_2/shop/view/ui_data.dart';
import 'package:flutter_test_task_2/shop/view/widgets/add_combo_button.dart';

class FilteredCombo extends StatelessWidget {
  final SaladFilterBloc saladBloc = SaladFilterBloc(Data.saladList);

  FilteredCombo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          FilterButtons(saladBloc: saladBloc),
          const SizedBox(height: 8),
          FilteredItems(saladBloc: saladBloc),
        ],
      ),
    );
  }
}

class FilterButtons extends StatelessWidget {
  final SaladFilterBloc saladBloc;

  const FilterButtons({
    super.key,
    required this.saladBloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaladFilterBloc, SaladFilterState>(
      bloc: saladBloc,
      builder: (context, state) {
        SaladFilter selectedFilter = state.selectedFilter;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: SaladFilter.values.map((filter) {
            final isSelected = filter == selectedFilter;

            return GestureDetector(
              onTap: () {
                saladBloc.add(FilterSalads(filter));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(filter.toString(),
                      style: isSelected
                          ? const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff27214D))
                          : const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff938DB5))),
                  isSelected
                      ? Container(
                          height: 2,
                          width: 22,
                          color: const Color(0xffFFA451),
                        )
                      : const SizedBox(height: 2),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class FilteredItems extends StatelessWidget {
  final SaladFilterBloc saladBloc;

  const FilteredItems({
    super.key,
    required this.saladBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SaladFilterBloc, SaladFilterState>(
        bloc: saladBloc,
        builder: (context, state) {
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
      width: 140,
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
              height: 80,
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
            // const SizedBox(height: 8),
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
                  const AddComboButton()
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
