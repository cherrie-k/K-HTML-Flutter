class ScrollItemData {
  final String title;
  final String imgPath;
  final String text;

  ScrollItemData(
      {required this.title, required this.imgPath, required this.text});
}

final List<ScrollItemData> items = [
  ScrollItemData(
    title: '첨단 기술과 효율적인 운영',
    imgPath: 'assets/images/sogakjang.jpg',
    text:
        '용인그린에코파크는 최신 소각 기술을 적용하여 폐기물을 처리합니다. 이를 통해 현재 용인 환경센터와 수지환경센터의 부족한 처리용량을 보완하고 있으며, 급증하는 폐기물 처리 수요를 효과적으로 관리하고 있습니다. 특히 인근의 첨단 시스템 반도체 국가산단과의 연계성을 통해 효율적인 운영이 가능합니다.',
  ),
  ScrollItemData(
    title: '주민을 위한 복합문화 체육시설',
    imgPath: 'assets/images/sports.jpg',
    text:
        '용인그린에코파크는 소각시설뿐만 아니라 주민들을 위한 복합문화 체육시설도 함께 조성되어 있습니다. 시민들은 전망 타워, 물놀이장, 수영장, 전시실 등 다양한 문화 복지 혜택을 누릴 수 있으며, 도로와 상하수도 등 편의시설도 완비되어 있습니다. 이로 인해 주민들은 쾌적한 환경에서 여가 시간을 보낼 수 있습니다.',
  ),
  ScrollItemData(
    title: '환경 보호와 지속 가능한 발전',
    imgPath: 'assets/images/hand_soil.png',
    text:
        '용인그린에코파크는 환경 보호를 최우선으로 고려하여 설계되었습니다. 철저한 환경영향평가를 통해 주변 생태계에 미치는 영향을 최소화하고 있으며, 첨단 소각 기술을 통해 오염물질을 완벽히 제거하고 있습니다. 이러한 노력 덕분에 소각장의 유해성 문제를 해결하고, 친환경적인 운영을 실현하고 있습니다.',
  ),
  ScrollItemData(
    title: '지역 사회와의 소통',
    imgPath: 'assets/images/community.jpg',
    text:
        '용인시는 용인그린에코파크를 운영함에 있어 지역 주민들과의 소통을 중요시하고 있습니다. 정기적인 주민설명회를 통해 주민들의 의견을 수렴하고, 홈페이지를 통해 관련 정보를 공개하여 투명한 운영을 하고 있습니다. 이를 통해 지역 사회와 함께하는 자원회수시설로 자리 잡았습니다.',
  ),
];
