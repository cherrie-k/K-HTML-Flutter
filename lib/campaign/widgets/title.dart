import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Appbar extends StatelessWidget {
  final VoidCallback onInfoClick;  // 콜백 함수 추가

  const Appbar({required this.onInfoClick, super.key});

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
        GestureDetector(
          onTap: onInfoClick,  // 클릭 시 전달된 함수 호출
          child: SvgPicture.asset(
            'assets/icons/info_btn.svg',
            height: 20,
          ),
        ),
      ],
    );
  }
}
