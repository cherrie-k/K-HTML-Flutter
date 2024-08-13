import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:k_html_flutter/campaign/widgets/title.dart'; // Appbar가 포함된 패키지
import 'package:k_html_flutter/components/bottomBar.dart'; // bottomBar가 포함된 패키지

class CampaignPage extends StatefulWidget {
  const CampaignPage({super.key});

  @override
  State<CampaignPage> createState() => _CampaignPageState();
}

class _CampaignPageState extends State<CampaignPage> {
  XFile? file;
  String explanation = '';
  String? imageUrl;
  bool trashClicked = true;
  TextEditingController promptController = TextEditingController();

  Future<void> _getRecycleExplanation(XFile img) async {
    if (trashClicked && img != null) {
      try {
        var request = http.MultipartRequest(
          'POST',
          Uri.parse('http://localhost:3000/upload'),
        );
        // 'image'라는 키로 파일 전송
        request.files.add(await http.MultipartFile.fromPath('image', img.path));

        var response = await request.send();

        if (response.statusCode == 200) {
          var responseData = await response.stream.bytesToString();

          // 앞뒤 따옴표 제거 처리
          responseData = responseData.trim();
          if (responseData.startsWith('"') && responseData.endsWith('"')) {
            responseData = responseData.substring(1, responseData.length - 1);
          }

          print("받은 responseData");
          print(responseData);  // 터미널에 응답 출력
          setState(() {
            explanation = responseData;
          });
        } else {
          print('Failed to upload image. Status code: ${response.statusCode}');
        }
      } catch (e) {
        print('Error occurred while uploading image: $e');
      }
    }
  }

  Future<void> _submitPrompt() async {
    String prompt = promptController.text;
    if (!trashClicked && prompt.isNotEmpty) {
      try {
        var request = http.MultipartRequest(
          'POST',
          Uri.parse('http://localhost:3000/uploads/reform'),
        );
        // 'image'와 'prompt'를 함께 전송
        if (file != null) {
          request.files.add(await http.MultipartFile.fromPath('image', file!.path));
        }
        request.fields['prompt'] = prompt;

        var response = await request.send();

        if (response.statusCode == 200) {
          var responseData = await response.stream.bytesToString();
          print("서버로부터 받은 응답: $responseData");  // 터미널에 응답 출력
          setState(() {
            if (responseData.startsWith('"') && responseData.endsWith('"')) {
              responseData = responseData.substring(1, responseData.length - 1);
            }
            imageUrl = responseData;
          });
        } else {
          print('이미지와 프롬프트 전송에 실패했습니다. 상태 코드: ${response.statusCode}');
        }
      } catch (e) {
        print('전송 중 오류 발생: $e');
      }
    }
  }

  Future<void> _pickImage() async {
    ImagePicker().pickImage(source: ImageSource.gallery).then((image) {
      if (image != null) {
        setState(() {
          file = image;
          explanation = 'loading ...';
          imageUrl = null; // Reset the imageUrl when a new image is picked
          if (trashClicked) {
            _getRecycleExplanation(image);
          }
        });
      }
    });
  }

  void _switchMenu() {
    setState(() {
      trashClicked = !trashClicked;
      file = null;
      imageUrl = null; // Reset the imageUrl when switching menus
    });
    print(trashClicked);
  }

  List<TextSpan> _buildTextSpans(String responseData) {
    List<TextSpan> spans = [];

    // 정규 표현식을 사용하여 '번호. 항목: ' 패턴을 찾아서 굵게 표시
    RegExp exp = RegExp(r'(\d+\.\s[^:]+:\s)');
    Iterable<RegExpMatch> matches = exp.allMatches(responseData);

    int lastIndex = 0;

    for (RegExpMatch match in matches) {
      if (match.start > lastIndex) {
        spans.addAll(_processTextWithLineBreaks(
          responseData.substring(lastIndex, match.start),
          FontWeight.normal,
        ));
      }

      spans.addAll(_processTextWithLineBreaks(
        match.group(0)!,
        FontWeight.bold,
      ));

      lastIndex = match.end;
    }

    if (lastIndex < responseData.length) {
      spans.addAll(_processTextWithLineBreaks(
        responseData.substring(lastIndex),
        FontWeight.normal,
      ));
    }

    return spans;
  }

  List<TextSpan> _processTextWithLineBreaks(String text, FontWeight fontWeight) {
    List<TextSpan> spans = [];
    List<String> parts = text.split('\\n');  // '\n'을 split의 기준으로 사용

    for (int i = 0; i < parts.length; i++) {
      spans.add(TextSpan(text: parts[i], style: TextStyle(fontWeight: fontWeight)));
      if (i < parts.length - 1) {
        spans.add(TextSpan(text: '\n'));  // 실제 줄바꿈 추가
      }
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Appbar(),
        automaticallyImplyLeading: false,
        centerTitle: false,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 33, vertical: 10),
              child: trashClicked
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/cT.svg',
                    height: 24,
                  ),
                  SizedBox(width: 20,),
                  GestureDetector(
                    onTap: _switchMenu,
                    child: SvgPicture.asset(
                      'assets/icons/uC.svg',
                      height: 21,
                    ),
                  ),
                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _switchMenu,
                    child: SvgPicture.asset(
                      'assets/icons/uT.svg',
                      height: 21,
                    ),
                  ),
                  SizedBox(width: 20,),
                  SvgPicture.asset(
                    'assets/icons/cC.svg',
                    height: 24,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Color(0xFFFFFFFF),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: (trashClicked)
                    ? (
                    (file != null)
                        ? Flex(
                      direction: Axis.vertical,
                      children: [
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Container(
                                  width: double.infinity,
                                  child: Image.file(
                                    File(file!.path),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Expanded(
                          flex: 4,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF57CE8F),
                                  Color(0xFF31C02D)
                                ],
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SingleChildScrollView(
                                child: Text.rich(
                                  TextSpan(
                                    children: _buildTextSpans(explanation),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                        : Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: _pickImage,
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
                    )
                )
                    : Column(
                  children: [
                    (imageUrl != null)
                        ? Expanded(
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Container(
                              width: double.infinity,
                              child: Image.network(
                                imageUrl!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                        : (file != null)
                        ? Expanded(
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Container(
                              width: double.infinity,
                              child: Image.file(
                                File(file!.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                        : Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: _pickImage,
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
                      ),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: promptController,
                            decoration: InputDecoration(
                              labelText: '  예: 치마로 리폼해줘',
                              // border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        GestureDetector(
                          onTap: _submitPrompt,
                          child: SvgPicture.asset(
                            'assets/icons/sB.svg',
                            height: 33,
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
            bottomBar(),
          ],
        ),
      ),
    );
  }
}