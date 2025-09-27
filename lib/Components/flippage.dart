import 'dart:math';
import 'package:flutter/material.dart';

class FlipPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  FlipPageRoute({required this.page})
    : super(
        transitionDuration: const Duration(milliseconds: 800),
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final rotate = Tween(begin: pi, end: 0.0).animate(animation);

          return AnimatedBuilder(
            animation: rotate,
            child: child,
            builder: (context, child) {
              final angle = rotate.value;
              return Transform(
                alignment: Alignment.center,
                transform:
                    Matrix4.identity()
                      ..setEntry(3, 2, 0.001) // perspective
                      ..rotateY(angle),
                child: child,
              );
            },
          );
        },
      );
}
