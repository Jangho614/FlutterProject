import 'package:intl/intl.dart'; // 날짜 형식화를 위해 추가
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/post/post_detail_screen.dart';
import 'PostModel.dart'; // PostModel 경로에 맞게 수정

class PostList extends StatelessWidget {
  final List<PostModel> posts;

  const PostList({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return posts.isEmpty
        ? Center(child: Text('게시글이 없습니다.'))
        : ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        final formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(post.date); // 날짜 형식화
        return ListTile(
          title: Text(post.title),
          subtitle: Text('${post.local} • $formattedDate'), // 날짜 추가
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostDetailScreen(post: post),
              ),
            );
          },
        );
      },
    );
  }
}
