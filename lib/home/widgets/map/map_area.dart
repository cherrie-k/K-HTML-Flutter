import 'package:flutter/material.dart';
import 'package:k_html_flutter/home/widgets/map/custom_pin.dart';

class MapArea extends StatefulWidget {
  const MapArea({super.key});

  @override
  State<MapArea> createState() => _MapAreaState();
}

class _MapAreaState extends State<MapArea> {
  bool _isModalVisible = false;

  void _toggleModal() {
    setState(() {
      _isModalVisible = !_isModalVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/map.png',
        ),
        Positioned(
          top: 48,
          left: 92,
          child: InkWell(
            onTap: () {
              _toggleModal();
            },
            child: const CustomPin(text: 'A'),
          ),
        ),
        const Positioned(
          top: 206,
          left: 130,
          child: CustomPin(text: 'B'),
        ),
        const Positioned(
          top: 96,
          left: 194,
          child: CustomPin(text: 'C'),
        ),
        const Positioned(
          top: 154,
          left: 238,
          child: CustomPin(text: 'D'),
        ),
        const Positioned(
          top: 122,
          right: 40,
          child: CustomPin(text: 'E'),
        ),
        // _isModalVisible
        //     ? Positioned(
        //         top: 20,
        //         left: 130,
        //         child: mapModal(),
        //       )
        //     : const SizedBox.shrink(),
        if (_isModalVisible)
          Positioned.fill(
            child: GestureDetector(
              onTap: _toggleModal,
              child: Container(
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Positioned(
                      top: 20,
                      left: 130,
                      child: GestureDetector(
                        onTap: () {}, // 안쪽 탭했을때 닫히는거 방지
                        child: mapModal(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget mapModal() {
    return Container(
      width: 234,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                '소각전망대',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF444444),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  debugPrint('TODO: redireect');
                },
                child: Transform.translate(
                  offset: const Offset(8, 0),
                  child: const Icon(
                    size: 28,
                    Icons.arrow_right,
                    color: Color(0xFFA0A0A0),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Image.asset(
                'assets/images/tower.jpeg',
                height: 100,
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  '소각전망대에서 용인그린에코파크의 전경을 한 눈에 담아보세요! 로맨틱한 프로포즈 명소이기도 한 이곳은 가족들에...',
                  style: TextStyle(
                    fontSize: 13.8,
                    color: Color(0xFF444444),
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
