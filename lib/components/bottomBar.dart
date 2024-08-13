import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class bottomBar extends StatelessWidget {
  const bottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(60, 15, 60, 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/chat');
              },
              child: SvgPicture.asset(
                'assets/icons/chat.svg',
                height: 25,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
              child: SvgPicture.asset(
                'assets/icons/home.svg',
                height: 60,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/splash');
              },
              child: SvgPicture.asset(
                'assets/icons/user.svg',
                height: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
