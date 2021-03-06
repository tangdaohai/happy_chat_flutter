import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/triangle.dart';
class Conversation extends StatefulWidget {
  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  // 消息免打扰
  bool _noDisturb = false;
  // 记录发送输入框的键盘弹出状态 true 表示弹出
  bool _iskeyBoardShow = false;
  // 发送信息的输入框
  FocusNode _sendMsgTextFieldNode = new FocusNode();
  // 消息列表的滚动条
  ScrollController _scrollController = new ScrollController();

  // 置顶
  void _setTopChanged (bool val) {

  }
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
  void dispose() {
    super.dispose();
    // 释放内存
    _sendMsgTextFieldNode.dispose();
    _scrollController.dispose();
  }

  Widget _msg (BuildContext context, int index) {
    bool isSelf = index % 2 == 0;
    String text = isSelf ? '哦' : '你好，喜欢养猫吗? 便宜出售了…你好，喜欢养猫吗? 便宜出售了…你好，喜欢养猫吗? 便宜出售了…';
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: isSelf ? TextDirection.rtl : TextDirection.ltr,
      children: <Widget>[
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/user_detail'),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('images/126244.jpg'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, left: isSelf ? 0 : 10, right: isSelf ? 10 : 0),
          child: CustomPaint(
            painter: TrianglePainter(
              color: isSelf ? Colors.deepPurpleAccent : Colors.white,
              direction: isSelf ? TriangleDirection.right : TriangleDirection.left,
            ),
            child: Container(
              width: 5,
              height: 10,
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: ScreenUtil().setWidth(220),
              minHeight: 40
            ),
            decoration: new BoxDecoration(
              color: isSelf ? Colors.deepPurpleAccent : Colors.white,
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: EdgeInsets.all(10),
            child: Text('$index $text')
          ),
        )
      ],
    );
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
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            offset: Offset(0, 60),
            onSelected: (value) {
              switch (value) {
                case '/user_detail':
                  print('跳转用户详情');
                  Navigator.pushNamed(context, value);
                  break;
                default:
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: '/user_detail',
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('images/126244.jpg'),
                  ),
                  title: Text('养猫的人')
                ),
              ),
              PopupMenuDivider(height: 1,),
              PopupMenuItem<String>(
                value: 'search_history',
                child: ListTile(
                  title: Text('查找聊天记录'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
              PopupMenuDivider(height: 1,),
              PopupMenuItem<String>(
                child: SwitchListTile(
                  title: Text('消息免打扰'),
                  value: _noDisturb,
                  onChanged: (bool newValue) {
                    setState(() {
                      _noDisturb = newValue;
                    });
                  },
                ),
              ),
              PopupMenuDivider(height: 1,),
              PopupMenuItem<String>(
                child: SwitchListTile(
                  title: Text('置顶'),
                  value: _noDisturb,
                  onChanged: (bool newValue) {
                    print(newValue);
                    setState(() {
                      _noDisturb = newValue;
                    });
                  },
                ),
              ),
              PopupMenuDivider(height: 1,),
              PopupMenuItem<String>(
                value: 'search_history',
                child: ListTile(
                  title: Text('设置当前的聊天背景'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
              PopupMenuDivider(height: 1,),
              PopupMenuItem<String>(
                value: 'search_history',
                child: ListTile(
                  title: Text('清空聊天记录'),
                ),
              ),
            ],
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
              child: Container(
                child: ListView.separated(
                  // 反转，第一条在最下面
                  reverse: true,
                  controller: _scrollController,
                  padding: EdgeInsets.all(10),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return _msg(context, index);
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                    );
                  }
                ),
              )
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