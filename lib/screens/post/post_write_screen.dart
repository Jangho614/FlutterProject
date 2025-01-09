import 'package:flutter/material.dart';
import 'PostModel.dart'; // PostModel 경로에 맞게 수정

class PostWrite extends StatefulWidget {

  const PostWrite({super.key});

  @override
  State<PostWrite> createState() => _PostWrite();


}

class _PostWrite extends State<PostWrite>{

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final _locals = ["서울특별시", "부산광역시", "대구광역시", "인천광역시", "광주광역시",
    "대전광역시", "울산광역시", "세종특별자치시", "경기도", "강원도",
    "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주특별자치도"];
  String _selectedLocals = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedLocals = _locals[0];
    });
  }
  void _submitPost() {
    final title = _titleController.text;
    final content = _contentController.text;
    final local = _selectedLocals;

    if (title.isNotEmpty && content.isNotEmpty) {
      final newPost = PostModel(
        title: title,
        content: content,
        local: local,
        date: DateTime.now(), // 현재 날짜 저장
      );
      Navigator.pop(context, newPost);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.symmetric()
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  Text(
                      "게시글 작성",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "지역 태그를 선택",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: DropdownButton(
                                menuMaxHeight: 300,
                                value : _selectedLocals,
                                items: _locals
                                    .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                )).toList(),
                                onChanged: (value){
                                  setState(() {
                                    _selectedLocals = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(10  ),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: TextField(
                            controller: _contentController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "제목"
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: TextField(
                            controller: _titleController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "내용"
                            ),
                            maxLines: 10,
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5), // 버튼 간 여백
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "취소하기",
                                    style: TextStyle(
                                      color: Colors.lightBlueAccent,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5), // 버튼 간 여백
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.lightBlueAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                  onPressed: (){
                                    _submitPost();
                                  },
                                  child: Text(
                                    "게시하기",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}