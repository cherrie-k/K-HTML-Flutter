import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10,),
        Text(
          '소각소각캠페인',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 13,),
        SvgPicture.asset(
          'assets/icons/info_btn.svg',
          height: 20,
        )
      ],
    );
  }
}
