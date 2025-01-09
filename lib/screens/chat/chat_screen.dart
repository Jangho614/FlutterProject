import 'package:flutter/material.dart';

import 'chatting_screen.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({super.key});

  @override
  State<ChatRoomScreen> createState() => ChatRoomScreenState();
}

class ChatRoomScreenState extends State<ChatRoomScreen> {
  final List<Map<String, dynamic>> chatRooms = [
    {
      'name': 'Study Group',
      'lastMessage': 'Did you finish the homework?',
      'timestamp': '10:30 AM',
    },
    {
      'name': 'Friends',
      'lastMessage': 'Let\'s meet at 7 PM!',
      'timestamp': '9:45 AM',
    },
    {
      'name': 'Family',
      'lastMessage': 'Dinner is ready!',
      'timestamp': '8:15 AM',
    },
  ];

  void _addChatRoom(String roomName) {
    setState(() {
      chatRooms.add({
        'name': roomName,
        'lastMessage': '',
        'timestamp': '',
      });
    });
  }

  void _showAddChatRoomDialog() {
    final TextEditingController _roomNameController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('채팅방 생성'),
          content: TextField(
            controller: _roomNameController,
            decoration: const InputDecoration(
              hintText: '채팅방 이름 입력',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () {
                if (_roomNameController.text.isNotEmpty) {
                  _addChatRoom(_roomNameController.text); // 채팅방 추가
                }
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: const Text('생성'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Rooms'),
      ),
      body: ListView.builder(
        itemCount: chatRooms.length,
        itemBuilder: (context, index) {
          final room = chatRooms[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(room['name'][0]), // 채팅방 첫 글자
            ),
            title: Text(room['name']),
            subtitle: Text(
              room['lastMessage'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(room['timestamp']), // 시간만 표시
            onTap: () {
              // 채팅방으로 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(chatRoomName: room['name']),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddChatRoomDialog, // 새 채팅방 추가 다이얼로그 열기
        child: const Icon(Icons.add),
      ),
    );
  }
}
