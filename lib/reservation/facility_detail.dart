import 'package:flutter/material.dart';

class FacilityDetailPage extends StatelessWidget {
  // final String title;
  // final String imgUrl;
  // final String tags;
  // final String description;
  final Map<String, dynamic> facilitiy;

  const FacilityDetailPage({
    Key? key,
    required this.facilitiy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(facilitiy['name'],
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
        ),
        body: Container(
            child: Column(children: [
          Image.asset(
            facilitiy['imgUrl'],
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  facilitiy['detail_info']['intro'],
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    facilitiy['detail_info']['tags'].join('  '),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text(
                  facilitiy['detail_info']['description'],
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: const Color(0xFFF3F5F7),
                    thickness: 1,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.place_rounded,
                            color: const Color(0xFF6FC295), size: 33),
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
                    Row(
                      children: [],
                    )
                  ],
                ),
              ],
            ),
          )
        ])));
  }
}
