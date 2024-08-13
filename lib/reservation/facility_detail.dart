import 'package:flutter/material.dart';

const timetable = [
  {'time': '오전 9:00', 'discount': '20% 할인'},
  {'time': '오전 9:30', 'discount': '20% 할인'},
  {'time': '오전 10:00', 'discount': '10% 할인'},
  {'time': '오전 10:30', 'discount': '10% 할인'},
  {'time': '오전 11:00', 'discount': '10% 할인'},
  {'time': '오전 11:30', 'discount': '10% 할인'},
  {'time': '오전 12:00', 'discount': '10% 할인'},
  {'time': '오전 12:30', 'discount': '10% 할인'},
];

class FacilityDetailPage extends StatelessWidget {
  final Map<String, dynamic> facilitiy;

  const FacilityDetailPage({
    Key? key,
    required this.facilitiy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          title: Text(facilitiy['name'],
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                facilitiy['imgUrl'],
                fit: BoxFit.cover,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Text(
                        facilitiy['detail_info']['intro'],
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        facilitiy['detail_info']['tags'].join('  '),
                        style: TextStyle(
                          fontSize: 15,
                          color: const Color(0xFF888888),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Text(
                        facilitiy['detail_info']['description'],
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      // 상세페이지랑 주변 인기 장소 분리
                      padding: EdgeInsets.all(10),
                      child: Divider(
                        color: const Color(0xFFF3F5F7),
                        thickness: 1,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.place_rounded,
                                color: const Color(0xFF6FC295),
                                size: 33,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '주변 인기 장소',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                child: PopularSpotCard(
                                  imgUrl: 'assets/images/propose.png',
                                  name: facilitiy['name'],
                                  description:
                                      '오후 8시에 진행되는 쓰레기 소각쇼도 보고 연인에게 프로포즈 하세요❣️',
                                ),
                              ),
                              PopularSpotCard(
                                imgUrl: 'assets/images/restaurant.png',
                                name: '용인그린에코랜드 레스토랑',
                                description:
                                    '4개의 라이브 키친에서 다양한 요리와 섬세한 맛을 만날 수 있는 뷔페 레스토랑',
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        color: const Color(0xFFF3F5F7),
                        thickness: 8,
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 8, left: 20),
                                child: Text(
                                  '예약 일시',
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(15),
                                padding: EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xFFF3F5F7),
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Icon(
                                        Icons.calendar_today_rounded,
                                        size: 21,
                                      ),
                                      SizedBox(width: 7),
                                      Text(
                                        '오늘 (수) / 2명',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ]),
                                    Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      size: 25,
                                      color: const Color(0xFF6FC295),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 55,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: timetable.length,
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(width: 10),
                                    itemBuilder: (context, index) {
                                      final time = timetable[index];
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFFFFFF),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)),
                                          border: Border.all(
                                            color: const Color(0xFF6FC295),
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 6),
                                              width: 90,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF6FC295),
                                              ),
                                              child: Text(
                                                '${time['time']}',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Text(
                                              '${time['discount']}',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: const Color(0xFF6FC295),
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  margin: EdgeInsets.all(20),
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 15, left: 15, right: 15),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xFF6FC295),
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(55),
                                  ),
                                  child: Container(
                                    width: 180,
                                    height: 19,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 13),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '예약가능 날짜 찾기',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: const Color(0xFF6FC295),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            size: 14,
                                            color: const Color(0xFF6FC295),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Divider(
                                  color: const Color(0xFFF3F5F7),
                                  thickness: 8,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 5),
                                    Text(
                                      '상세 정보',
                                      style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.directions_car,
                                          color: const Color(0xFF6FC295)
                                              .withOpacity(0.8),
                                        ),
                                        SizedBox(
                                          width: 5,
                                          height: 35,
                                        ),
                                        Text(
                                          '주차가능',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: const Color(0xFF6FC295)
                                                .withOpacity(0.8),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 9,
                                    ),
                                    Text(
                                      '전화번호',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.phone,
                                            color: const Color(0xFF000000)
                                                .withOpacity(0.5),
                                            size: 18),
                                        SizedBox(
                                          width: 5,
                                          height: 35,
                                        ),
                                        Text(
                                          '010-4688-5964',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: const Color(0xFF53AFF2)
                                                .withOpacity(0.8),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 9,
                                    ),
                                    Text(
                                      '영업시간',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      '매일 • 9:00 ~ 20:00',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: const Color(0xFF000000)
                                            .withOpacity(0.7),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class PopularSpotCard extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String description;

  const PopularSpotCard({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
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
              imgUrl,
              height: 140,
              width: double.infinity, // 카드 너비에 맞게 설정
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF151515),
                  ),
                ),
                Text(
                  description,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
