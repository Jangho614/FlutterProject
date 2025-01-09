import 'package:flutter/material.dart';
import 'package:flutter_project/screens/post/post_write_screen.dart';
import 'PostModel.dart'; // PostModel 경로에 맞게 수정
import 'PostList.dart'; // PostList 위젯 경로에 맞게 수정

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<PostModel> _posts = []; // 게시글 리스트

  void _addPost(PostModel post) {
    setState(() {
      _posts.add(post);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Screen'),
      ),
      body: PostList(posts: _posts), // PostList 위젯 사용
      floatingActionButton: FloatingActionButton(
        heroTag: "postWrite",
        backgroundColor: Color.fromRGBO(189, 247, 255, 1),
        elevation: 0.5,
        onPressed: () async {
          final newPost = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PostWrite()),
          );
          if (newPost != null && newPost is PostModel) {
            _addPost(newPost);
          }
        },
        child: Icon(
          color: Colors.blueAccent,
          Icons.post_add_outlined,
        ),
      ),
    );
  }
}
