import 'package:flutter/material.dart';
import 'package:flutter_project/screens/post/post_write_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(189, 247, 255, 1),
        elevation: 0.5,
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PostWrite())
          );
        },
        child: Icon(
          color: Colors.blueAccent,
          Icons.post_add_outlined
        ),
      ),
      body: Center(
        child: Text('Post Screen Content'),
      ),
    );
  }

}