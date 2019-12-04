import 'package:flutter/material.dart';
class Conversation extends StatefulWidget {
  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('养猫的人'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => {},
          )
        ],
      ),
      body: GestureDetector(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Text('会话内容'),
            ),
            Container(child: TextField(
              decoration: InputDecoration(labelText: '底部输入'),
            ),)
          ],
        ),
      ),
    );
  }
}