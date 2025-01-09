import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}



class _ChatScreenState extends State<ChatScreen>{
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child:Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[100],
                    ),
                    child: TextField(
                      controller: _controller,
                      style:TextStyle(
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText:"메세지 입력",
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: (){
                      if(_controller.text.isNotEmpty){
                      }
                    },
                    icon: Icon(Icons.send)
                )
              ],
            )
          )
        ],
      ),
    );
  }

}