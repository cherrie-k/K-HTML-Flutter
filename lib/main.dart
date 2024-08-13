import 'package:flutter/material.dart';
import 'package:k_html_flutter/campaign/campaign_page.dart';
import 'package:k_html_flutter/chat/chat_page.dart';
import 'package:k_html_flutter/home/home_page.dart';
import 'package:k_html_flutter/notice/notice_page.dart';
import 'package:k_html_flutter/reservation/reservation_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF6F6F6),
        fontFamily: 'Pretendard',
        appBarTheme: const AppBarTheme(
          color: Color(0xFFFFFFFF),
        ),
        useMaterial3: true,
      ),
      routes: {
        '/home': (context) => HomePage(),
        '/chat': (context) => ChatPage(),
        '/campaign': (context) => CampaignPage(),
        '/notice': (context) => NoticePage(),
        '/reservation': (context) => ReservationPage(),
      },
      home: const HomePage(),
    );
  }
}
