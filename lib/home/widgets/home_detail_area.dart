import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:k_html_flutter/home/widgets/side_scroll/scroll_page.dart';

class HomeDetailArea extends StatelessWidget {
  const HomeDetailArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0XFFFFFFFF),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
        border: Border(
          top: BorderSide(
            color: Color(0XFFF2F2F2),
            width: 1.5,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/leaf.svg',
                      width: 18,
                      colorFilter: ColorFilter.mode(
                        const Color(0xFFFFFFFF).withOpacity(0.3),
                        BlendMode.srcOver,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      'assets/icons/leaf.svg',
                      width: 18,
                      colorFilter: ColorFilter.mode(
                        const Color(0xFFFFFFFF).withOpacity(0.3),
                        BlendMode.srcOver,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      'assets/icons/leaf.svg',
                      width: 18,
                      colorFilter: ColorFilter.mode(
                        const Color(0xFFFFFFFF).withOpacity(0.3),
                        BlendMode.srcOver,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Text(
                  '용인그린에코파크',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF444444),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  '지속 가능한 미래를 위한 새로운 자원회수시설',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF939393),
                  ),
                ),
                SizedBox(height: 14),
              ],
            ),
          ),
          Image.asset(
            'assets/images/green_park.jpg',
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 14),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              '용인그린에코파크는 용인특례시가 자랑하는 첨단 자원회수시설로, 처인구 이동읍 덕성리 산 79번지에 위치하고 있습니다. 총 3850억원의 예산이 투입되어 건설된 이 시설은 하루 500톤의 폐기물을 처리할 수 있는 능력을 갖추고 있습니다.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(height: 90),
          SizedBox(
            height: 600,
            child: ScrollPage(),
          ),
        ],
      ),
    );
  }
}
