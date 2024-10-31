import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SearchField(),
        SizedBox(width: 16),
        Icon(Icons.filter_list_sharp),
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
        child: const TextField(
          decoration: InputDecoration(
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
