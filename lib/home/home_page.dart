import 'package:flutter/material.dart';
import 'package:k_html_flutter/global/widgets/custom_appbar.dart';
import 'package:k_html_flutter/home/widgets/home_body_btn.dart';
import 'package:k_html_flutter/home/widgets/home_detail_area.dart';
import 'package:k_html_flutter/home/widgets/map/map_area.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: '용인그린에코파크',
        showBack: false,
        context: context,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MapArea(),
            bodyButtonsArea(),
            HomeDetailArea(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/chat');
              },
              child: Text('Chat Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/campaign');
              },
              child: Text('Campaign Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/notice');
              },
              child: Text('Notice Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/reservation');
              },
              child: Text('Reservation Page'),
            ),
          ],
        ),
      ),
    );
  }

  Widget bodyButtonsArea() {
    return SizedBox(
      height: 400,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 46),
        child: Row(
          children: [
            Expanded(
              child: HomeBodyBtn(
                title: '소각소각 캠페인',
                description: '더 편하게 재활용하기\n의류의 재발견',
                img: Transform.translate(
                  offset: const Offset(3, 2),
                  child: Image.asset(
                    'assets/images/earth_illust.png',
                    width: 180,
                  ),
                ),
                onTap: () {},
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: HomeBodyBtn(
                      title: '예약',
                      img: Transform.translate(
                        offset: const Offset(-7, -9),
                        child: Image.asset(
                          'assets/images/book_illust.png',
                          width: 80,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: HomeBodyBtn(
                      title: '에코파크 소식',
                      img: Transform.translate(
                        offset: const Offset(5, 0),
                        child: Image.asset(
                          'assets/images/bulb_illust.png',
                          width: 80,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
