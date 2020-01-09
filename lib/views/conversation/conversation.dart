import 'package:flutter/material.dart';
class Conversation extends StatefulWidget {
  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  // 记录发送输入框的键盘弹出状态 true 表示弹出
  bool _iskeyBoardShow = false;
  FocusNode _sendMsgTextFieldNode = new FocusNode();
  // 修改键盘弹出状态
  void _changeKeyBoardStatus () {
    setState(() {
      _iskeyBoardShow = _sendMsgTextFieldNode.hasFocus;
    });
  }

  @override
  void initState() {
    super.initState();
    // 绑定监听
    _sendMsgTextFieldNode.addListener(_changeKeyBoardStatus);
  }

  @override
  void deactivate() {
    super.deactivate();
    // 解绑·监听
    _sendMsgTextFieldNode.removeListener(_changeKeyBoardStatus);
  }

  @override
  Widget build(BuildContext context) {

    // 获取全面屏下方的距离，如果是非全面屏 bottomSize = 0
    final double bottomSize = MediaQuery.of(context).padding.bottom;

    // final ThemeData theme = Theme.of(context);

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
        onTap: () {
          // 点击其他地方收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: <Widget>[ 
            Expanded(
              child: Text(_iskeyBoardShow ? '键盘展示' : '键盘隐藏了'),
            ),
            // 底部操作区域
            Card(
              margin: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(),
              color: Colors.white70,
              child: Container(
                // 考虑全面屏 底部是圆弧 所以如果是全面屏下面会空出距离
                padding: EdgeInsets.only(top: 10, bottom: 10.0 + (_iskeyBoardShow ? 0 : bottomSize)),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.sentiment_satisfied),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.mic),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: TextField(
                        focusNode: _sendMsgTextFieldNode,
                        textInputAction: TextInputAction.send,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          focusedBorder: const OutlineInputBorder()
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            )
            // Container(child: TextField(
            //   decoration: InputDecoration(labelText: '底部输入'),
            // ),)
          ],
        ),
      ),
    );
  }
}