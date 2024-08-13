import 'package:flutter/material.dart';

class ScrollItem extends StatelessWidget {
  final String text;
  final String imgPath;

  const ScrollItem({
    super.key,
    required this.text,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            imgPath,
            height: 217,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 12),
          Text(
            text,
            style: const TextStyle(fontSize: 15, color: Color(0xFF444444)),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
