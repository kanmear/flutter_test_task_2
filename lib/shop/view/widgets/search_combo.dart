import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'package:flutter_test_task_2/shop/view/widgets/search_bar.dart';
import 'package:flutter_test_task_2/shop/view/widgets/add_combo_button.dart';

import 'package:flutter_test_task_2/shop/data/data.dart';
import 'package:flutter_test_task_2/shop/data/models/salad.dart';

import 'package:flutter_test_task_2/shop/state/salad_search_bloc.dart';

class SearchCombo extends StatelessWidget {
  const SearchCombo({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Salad>>(
        future: Data.mockFetch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(color: Color(0xffF08626));
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final SaladSearchBloc saladBloc = SaladSearchBloc(snapshot.data!);

            return BlocProvider(
              create: (_) => saladBloc..add(LoadInitialSalads()),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomSearchBar(),
                  SizedBox(height: 38),
                  Header(),
                  SizedBox(height: 24),
                  SaladList()
                ],
              ),
            );
          } else {
            return const Text('No data available');
          }
        });
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaladSearchBloc, SaladSearchState>(
      builder: (context, searchState) {
        return Text(
          searchState.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        );
      },
    );
  }
}

class SaladList extends StatelessWidget {
  const SaladList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaladSearchBloc, SaladSearchState>(
      builder: (context, state) {
        if (state.saladList.isEmpty) {
          return const Center(child: Text('Couldn\'t find anything'));
        }

        return SizedBox(
          height: 185,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: state.saladList.length,
            itemBuilder: (context, index) {
              return SaladTile(salad: state.saladList[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 22);
            },
          ),
        );
      },
    );
  }
}

class SaladTile extends StatelessWidget {
  final Salad salad;

  const SaladTile({super.key, required this.salad});

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter = NumberFormat('#,000');

    return Stack(
      children: [
        Container(
          width: 152,
          decoration: BoxDecoration(
            color: const Color(0xffF3F4F9),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 22),
              SizedBox(
                height: 80,
                child: Image.network(
                  Data.getSrcById(salad.id),
                  fit: BoxFit.contain,
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
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
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
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
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
                    AddComboButton(comboName: salad.name)
                  ],
                ),
              ),
            ],
          ),
        ),
        const Positioned(
          right: 16,
          top: 16,
          child: Icon(
            Icons.favorite_border,
            color: Color(0xffFFA451),
            size: 16,
          ),
        )
      ],
    );
  }
}
