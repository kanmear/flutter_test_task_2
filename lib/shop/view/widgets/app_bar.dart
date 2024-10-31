import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      // padding: const EdgeInsets.only(left: 28, right: 40),
      child: AppBar(
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
