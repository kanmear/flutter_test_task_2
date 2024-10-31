import 'package:flutter_test_task_2/shop/data/data.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'package:flutter_test_task_2/shop/data/models/salad.dart';

class RecommendedCombo extends StatelessWidget {
  const RecommendedCombo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Recommended Combo',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 24),
        RecommendedItems()
      ],
    );
  }
}

class RecommendedItems extends StatelessWidget {
  const RecommendedItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SaladTile(
          salad: Data.saladList.first,
        ),
        const SizedBox(width: 24),
        SaladTile(
          salad: Data.saladList[1],
        ),
      ],
    );
  }
}

class SaladTile extends StatelessWidget {
  final Salad salad;

  const SaladTile({super.key, required this.salad});

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter = NumberFormat('#,000');

    return Expanded(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffF3F4F9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const SizedBox(height: 22),
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.network(
                    Data.getSrcById(salad.id),
                    fit: BoxFit.fill,
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
                const SizedBox(height: 12),
                Text(
                  salad.name,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
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
                      GestureDetector(
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
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
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
      ),
    );
  }
}
