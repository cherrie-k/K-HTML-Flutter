import 'package:flutter/material.dart';
import 'package:k_html_flutter/global/widgets/custom_appbar.dart';
import 'package:k_html_flutter/notice/widgets/notice_item.dart';
import 'package:k_html_flutter/notice/widgets/notice_item_data.dart';

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
      body: Padding(
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
    );
  }
}
