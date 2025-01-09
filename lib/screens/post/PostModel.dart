class PostModel {
  final String title;
  final String content;
  final String local;
  final DateTime date; // 날짜 필드 추가

  PostModel({
    required this.title,
    required this.content,
    required this.local,
    required this.date, // 날짜 필드 초기화
  });
}
