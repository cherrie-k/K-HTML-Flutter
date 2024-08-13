import 'package:flutter/material.dart';
import 'package:k_html_flutter/global/widgets/custom_appbar.dart';
import 'package:k_html_flutter/notice/widgets/notice_item.dart';
import 'package:k_html_flutter/notice/widgets/notice_item_data.dart';
import '../components/bottomBar.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar(
          title: '에코파크 소식',
          showBack: false,
          context: context,
        ),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 24,
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 6.3 / 7,
              ),
              itemCount: noticeItems.length,
              itemBuilder: (context, idx) => NoticeItem(
                item: noticeItems[idx],
              ),
            ),
          ),
          Positioned(
            bottom: 0, // 화면의 하단에 고정
            left: 0, // 화면의 왼쪽에 고정
            right: 0, // 화면의 오른쪽에 고정
            child: bottomBar(), // 하단에 고정할 위젯
          ),
        ]));
  }
}
