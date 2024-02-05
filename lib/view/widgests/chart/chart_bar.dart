import 'package:flutter/material.dart';
import 'package:wedding_gift/constants.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.fill});
  final double fill;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: DecoratedBox(
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                color: bottomNavColor,
                // color: Color.fromARGB(255, 211, 143, 83),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  "${(fill * 100).toStringAsFixed(1)}%",
                  style: const TextStyle(
                    color: chartBarPercentageColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              )),
        ),
      ),
    );
  }
}
