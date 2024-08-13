import 'package:flutter/material.dart';

class HomeBodyBtn extends StatelessWidget {
  final String title;
  final String? description;
  final Widget img;
  final VoidCallback onTap;

  const HomeBodyBtn({
    super.key,
    required this.title,
    this.description,
    required this.img,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 16, top: 18),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFFFFFFFF),
          border: Border.all(
            color: const Color(0XFFF4F3F3),
            width: 1.2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF444444),
              ),
            ),
            description != null
                ? Text(
                    description!,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.3,
                      color: Color(0xFF767676),
                    ),
                  )
                : const SizedBox.shrink(),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: img,
            ),
          ],
        ),
      ),
    );
  }
}
