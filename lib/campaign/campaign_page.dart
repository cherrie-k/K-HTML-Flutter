import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:k_html_flutter/campaign/elements/imageUpload.dart';
import 'package:k_html_flutter/campaign/widgets/title.dart';
import 'package:k_html_flutter/components/bottomBar.dart';
import 'package:image_picker/image_picker.dart';

class CampaignPage extends StatefulWidget {
  const CampaignPage({super.key});

  @override
  State<CampaignPage> createState() => _CampaignPageState();
}

class _CampaignPageState extends State<CampaignPage> {
  XFile? _image; //이미지를 담을 변수 선언
  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/cT.svg',
                        height: 24,
                      ),
                      SizedBox(width: 20,),
                      SvgPicture.asset(
                        'assets/icons/uC.svg',
                        height: 21,
                      ),
                    ],
                  )
              ),
              Expanded(
                child: Container(
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
                ),
              ),
              bottomBar(),
            ],
          ),
        )
    );
  }
}