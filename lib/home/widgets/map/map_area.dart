import 'package:flutter/material.dart';

class MapArea extends StatelessWidget {
  const MapArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/map.png',
        ),
      ],
    );
  }
}
