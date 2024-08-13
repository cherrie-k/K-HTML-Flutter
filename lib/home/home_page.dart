import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/chat');
              },
              child: Text('Chat Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/campaign');
              },
              child: Text('Campaign Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/notice');
              },
              child: Text('Notice Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/reservation');
              },
              child: Text('Reservation Page'),
            ),
          ],
        ),
      ),
    );
  }
}
