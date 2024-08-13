import 'package:flutter/material.dart';
import 'package:k_html_flutter/home/widgets/scroll_item.dart';
import 'scroll_item_data.dart';

class ScrollPage extends StatefulWidget {
  const ScrollPage({super.key});

  @override
  State<ScrollPage> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _nextPage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % items.length;
    });
    _pageController.animateToPage(
      _currentIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + items.length) % items.length;
    });
    _pageController.animateToPage(
      _currentIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_left_rounded,
                  color: Color(
                    0xFF898989,
                  ),
                  size: 30,
                ),
                onPressed: _previousPage,
              ),
              Text(
                items[_currentIndex].title,
                style: const TextStyle(
                    color: Color(0xFF444444),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Color(
                    0xFF898989,
                  ),
                  size: 30,
                ),
                onPressed: _nextPage,
              ),
            ],
          ),
        ),
        Expanded(
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ScrollItem(
                text: item.text,
                imgPath: item.imgPath,
              );
            },
          ),
        ),
      ],
    );
  }
}
