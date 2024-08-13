import 'package:flutter/material.dart';
import './facility_detail.dart';
import './facilities.dart';
import '../components/bottomBar.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('시설 예약',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
        ),
        body: Stack(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: ListView.separated(
              itemCount: facilities.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 20);
              },
              itemBuilder: (context, index) {
                return FacilityCard(
                  facilitiy: facilities[index],
                );
              },
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

class FacilityCard extends StatelessWidget {
  final Map<String, dynamic> facilitiy;

  const FacilityCard({
    Key? key,
    required this.facilitiy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FacilityDetailPage(
              facilitiy: facilitiy,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              child: Image.asset(
                facilitiy['imgUrl'],
                height: 150,
                width: double.infinity, // 카드 너비에 맞게 설정
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(facilitiy['name'],
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF151515),
                      )),
                  Text(
                    facilitiy['tags'].join(' '),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.grey),
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
