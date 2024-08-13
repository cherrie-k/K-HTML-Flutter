import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPin extends StatelessWidget {
  final String text;

  const CustomPin({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: -6,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(99),
          ),
        ),
        SvgPicture.string(
          '''<svg width="27" height="27" viewBox="0 0 27 27" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M13.5001 0C18.2101 0 22.0283 3.81823 22.0283 8.52831C22.0283 12.8135 18.7075 20.9317 13.5 27C8.29249 20.9318 4.9717 12.8135 4.9717 8.52831C4.9717 3.81823 8.78999 0 13.5001 0Z" fill="#53AFF2"/>
<g opacity="0.1">
<path d="M18.1297 6.63768C17.2999 3.25925 14.5632 0.850553 11.3462 0.274535C12.0343 0.0955019 12.7559 0 13.5 0C18.21 0 22.0283 3.81823 22.0283 8.52831C22.0283 12.4156 19.2954 19.4573 14.9004 25.2615C18.0145 18.4126 19.0881 10.5401 18.1297 6.63768Z" fill="black"/>
</g>
</svg>''',
          width: 36,
          height: 36,
        ),
        Positioned(
          top: 1,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
