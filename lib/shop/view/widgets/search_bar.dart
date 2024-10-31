import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test_task_2/shop/state/salad_search_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SearchField(),
        const SizedBox(width: 16),
        SvgPicture.asset(
          'assets/svg/filter.svg',
          width: 24,
          height: 24,
          fit: BoxFit.scaleDown,
        )
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0xffF3F4F9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          onChanged: (query) {
            context.read<SaladSearchBloc>().add(SearchSalads(query));
          },
          decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.zero)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.zero)),
              hintText: 'Search for fruit salad combos',
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff86869E),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(right: 16, left: 24),
                child: Icon(Icons.search, size: 16),
              )),
        ),
      ),
    );
  }
}
