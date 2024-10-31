import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 32),
      child: AppBar(
        backgroundColor: const Color(0xffF0F0F0),
        leading: SvgPicture.asset(
          'assets/svg/menu.svg',
          width: 24,
          height: 24,
          fit: BoxFit.scaleDown,
        ),
        actions: [
          GestureDetector(
              onTap: () => {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/shopping_basket.svg',
                    width: 24,
                    height: 24,
                    fit: BoxFit.scaleDown,
                  ),
                  const Text(
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
