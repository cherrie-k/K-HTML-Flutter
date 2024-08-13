import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CampaignPage extends StatelessWidget {
  const CampaignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              '소각소각캠페인',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Pretendard',
              ),
            ),
            SizedBox(width: 10,),
            SvgPicture.asset(
              'assets/icons/?_btn.svg',
              height: 20,
            )
          ],
        ),
        automaticallyImplyLeading: false,
        centerTitle: false, // 타이틀을 왼쪽에 정렬합니다.
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '소각소각캠페인',
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
