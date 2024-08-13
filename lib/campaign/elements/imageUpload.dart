import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class imageUpload extends StatelessWidget {
  const imageUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/camera.svg',
                height: 83,
              ),
              SizedBox(height: 4,),
              Text(
                '이미지 업로드',
                style: TextStyle(
                  color: Color(0xFF383838),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
