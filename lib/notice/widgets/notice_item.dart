import 'package:flutter/material.dart';
import 'package:k_html_flutter/notice/widgets/notice_item_data.dart';

class NoticeItem extends StatelessWidget {
  final NoticeItemData item;

  const NoticeItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        border: Border.all(
          color: const Color(0xFFF2F2F2),
          width: 1.4,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              item.imgPath,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 12,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  item.time,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF909090),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
