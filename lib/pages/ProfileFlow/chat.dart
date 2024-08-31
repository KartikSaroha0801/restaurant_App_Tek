import 'package:flutter/material.dart';
import 'package:restaurent_app_tek/widgets/app_bar.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            AppBAR(title: "Support 24*7"),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildChatBubble(
                    text: "I think the idea that things are chaning isnt good",
                    isSender: false,
                  ),
                  _buildChatBubble(
                    text: "What do you mean?",
                    isSender: true,
                  ),
                  _buildChatBubble(
                    text: "I think the idea that things are chaning isnt good",
                    isSender: false,
                  ),
                  _buildChatBubble(
                    text: "What do you mean?",
                    isSender: true,
                  ),
                  _buildChatBubble(
                    text: "I think the idea that things are chaning isnt good",
                    isSender: false,
                  ),
                  _buildChatBubble(
                    text: "What do you mean?",
                    isSender: true,
                  ),
                ],
              ),
            ),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildChatBubble({required String text, required bool isSender}) {
    return Align(
      alignment: isSender ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: ShapeDecoration(
          color: isSender ? Color(0xFFFF4D4D) : Color(0xFFF5F5F5),
          shape: RoundedRectangleBorder(
            borderRadius: isSender
                ? BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  )
                : BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                  ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSender ? Colors.white : Colors.black,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: [
                  Icon(Icons.attach_file, color: Color(0xFFFF3A30)),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Type a message",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 16.0),
          CircleAvatar(
            radius: 24.0,
            backgroundColor: Color(0xFFFF4D4D),
            child: Icon(Icons.mic, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
