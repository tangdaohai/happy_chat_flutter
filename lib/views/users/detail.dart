import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDetail extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          // 头像图片
          Image(
            image: AssetImage('images/126244.jpg'),
            width: ScreenUtil().setWidth(375),
            height: ScreenUtil().setHeight(280),
            fit: BoxFit.fitWidth,
          ),
          // 备注与昵称 以及星标
          ListTile(
            leading: Icon(Icons.person, size: 40,),
            title: Text('悠扬小Q'),
            subtitle: Text('昵称：悠扬小Q'),
            trailing: GestureDetector(
              onTap: () {
                print('星标');
              },
              child: Icon(Icons.star),
            ),
          ),
          // 个人介绍（个性签名）
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: Text('Flutter appyes', style: Theme.of(context).textTheme.caption,),
          ),
          Divider(height: 1,),
          // id
          ListTile(
            leading: Icon(Icons.drag_handle, size: 40),
            title: Text('EA888'),
            subtitle: Text('ID'),
          ),
          Divider(height: 1,),
          // 对这个人的标签
          ListTile(
            leading: Icon(Icons.bookmark, size: 40,),
            title: Text('程序员'),
            subtitle: Text('标签'),
          ),
          Divider(height: 1,),
        ],
      )
    );
  }
}