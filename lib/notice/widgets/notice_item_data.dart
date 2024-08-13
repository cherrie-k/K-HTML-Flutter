class NoticeItemData {
  final String title;
  final String imgPath;
  final String time;

  NoticeItemData({
    required this.title,
    required this.imgPath,
    required this.time,
  });
}

final List<NoticeItemData> noticeItems = [
  NoticeItemData(
    title: '스위밍 센터 휴관 일정',
    imgPath: 'assets/images/swim.jpg',
    time: '어제',
  ),
  NoticeItemData(
    title: '조아용 팝업 스토어 개최',
    imgPath: 'assets/images/yongyong.png',
    time: '어제',
  ),
  NoticeItemData(
    title: '용인시장 악수회 일정 안내',
    imgPath: 'assets/images/sijang.jpeg',
    time: '8/2',
  ),
  NoticeItemData(
    title: '프로포즈 체험단 모집',
    imgPath: 'assets/images/propose.png',
    time: '8/1',
  ),
  NoticeItemData(
    title: '8월 휴무일 안내',
    imgPath: 'assets/images/map.png',
    time: '7/25',
  ),
  NoticeItemData(
    title: '서천초등학교생 견학 일정',
    imgPath: 'assets/images/school.jpeg',
    time: '7/22',
  ),
  NoticeItemData(
    title: '소각갤러리 - 자연과 인간',
    imgPath: 'assets/images/poster.jpg',
    time: '7/17',
  ),
  NoticeItemData(
    title: '용인시민의날 기념행사',
    imgPath: 'assets/images/citizen.jpg',
    time: '7/2',
  ),
];
