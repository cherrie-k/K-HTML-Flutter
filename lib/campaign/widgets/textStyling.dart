import 'package:flutter/material.dart';

class StyledResponseText extends StatelessWidget {
  final String responseData;

  StyledResponseText(this.responseData);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text.rich(
        TextSpan(
          children: _buildTextSpans(responseData),
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  List<TextSpan> _buildTextSpans(String responseData) {
    // 줄바꿈 단위로 텍스트 분리
    List<String> lines = responseData.split('\n');
    List<TextSpan> spans = [];

    for (String line in lines) {
      if (line.startsWith('1. ') || line.startsWith('2. ')) {
        spans.add(
          TextSpan(
            text: line.split(': ')[0] + ': ',
            style: TextStyle(fontWeight: FontWeight.bold), // 볼드 처리
          ),
        );
        spans.add(
          TextSpan(
            text: line.split(': ')[1] + '\n',
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
        );
      } else {
        spans.add(
          TextSpan(
            text: line + '\n',
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
        );
      }
    }

    return spans;
  }
}
