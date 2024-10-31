import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 32),
      child: AppBar(
        backgroundColor: const Color(0xffF0F0F0),
        leading: const Icon(Icons.menu),
        actions: [
          GestureDetector(
              onTap: () => {},
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_basket_outlined),
                  Text(
                    'My basket',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                  )
                ],
              ))
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
