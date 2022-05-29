
class Post {
  final String nickname;
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.nickname,
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      nickname: json['nickname'] as String,
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}